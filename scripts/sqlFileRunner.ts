// sqlFileRunner.ts
import { spawnSync } from "child_process";
import { readFileSync, existsSync } from "node:fs";
import { resolve } from "node:path";

// docker exec -i pg18 psql -U student -d playground < sql\hoge.sql

// 接続設定
const container = "pg18";
const user = "student";
const database = "playground";
const argv = process.argv.slice(2);

// 言語フラグの取得
let langOpt: string | undefined;
const langIdx = argv.findIndex((a) => a.startsWith("--lang="));
if (langIdx >= 0) {
  langOpt = argv[langIdx].split("=")[1]?.trim();
  argv.splice(langIdx, 1);
} else {
  const enIdx = argv.indexOf("--en");
  if (enIdx >= 0) {
    langOpt = "C";
    argv.splice(enIdx, 1);
  }
}

// SQLファイルのパスを取得
const sqlFile = argv[0];
if (!sqlFile) {
  process.stderr.write("SQL file path is required.\n");
  process.exit(1);
}
const abs = resolve(sqlFile);
if (!existsSync(abs)) {
  process.stderr.write(`SQL file not found: ${abs}\n`);
  process.exit(1);
}

// docker exec 引数を組み立て
const args: string[] = ["exec", "-i"];

// メッセージ言語を変える場合は PGOPTIONS を注入
if (langOpt) {
  args.push("-e", `PGOPTIONS=-c lc_messages=${langOpt}`);
}

// psql は .psqlrc を読まない(-X) & エラー後も処理を継続する(ON_ERROR_STOP=0)
args.push(
  container,
  "psql",
  "-X",
  "-U",
  user,
  "-d",
  database,
  "-v",
  "ON_ERROR_STOP=0",
  "-f",
  "-", // stdin から読む
);

// 実行（PowerShellでも < リダイレクト不要）
const res = spawnSync("docker", args, {
  input: readFileSync(abs, "utf-8"),
  encoding: "utf-8",
});

const stderrHeader = `\n----- stderr from psql (${sqlFile.replace(/\\/g, "/")}) -----\n`;

// 正常終了時も標準出力と標準エラー出力を表示して終了
if (res.status === 0) {
  if (res.stdout) process.stdout.write(res.stdout);
  if (res.stderr && res.stderr.trim().length > 0) {
    process.stderr.write(stderrHeader);
    process.stderr.write(res.stderr);
  }
  process.exit(0);
}

// 失敗時: psql のエラーまたは docker のエラーを出す
if (res.stderr && res.stderr.trim().length > 0) {
  process.stderr.write(stderrHeader);
  process.stderr.write(res.stderr);
} else if (res.error) {
  process.stderr.write(`Failed to run docker/psql: ${res.error.message}\n`);
}
process.exit(typeof res.status === "number" ? res.status : 1);
