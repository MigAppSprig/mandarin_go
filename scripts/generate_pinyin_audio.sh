#!/usr/bin/env bash
#
# 生成拼音音素音频（声母呼读音 + 韵母本音），共 47 个 M4A 文件。
#
# 依赖：macOS 自带的中文 TTS 语音（`say` 命令，Tingting 语音）。
# 用法：bash scripts/generate_pinyin_audio.sh
#
# 想换成真人录音？直接用同名文件覆盖 assets/audio/pinyin/ 下的文件即可，
# 命名规则：initial_<声母>.m4a 、 final_<韵母>.m4a（ü 写成 v）。
#
set -euo pipefail

cd "$(dirname "$0")/.."
OUT="assets/audio/pinyin"
mkdir -p "$OUT"

# 使用的语音（Tingting 婷婷，标准普通话女声）
VOICE="Tingting"

# 声母：符号=呼读音汉字
# 注意：优先选第一声、且不被 TTS 误读的字（d 用“德”而非“得”，避免读成轻声助词 de）
init_syms=(b p m f d t n l g k h j q x zh ch sh r z c s y w)
init_hanzi=(玻 坡 摸 佛 德 特 讷 勒 哥 科 喝 基 欺 希 知 吃 诗 日 资 疵 思 衣 乌)
for i in "${!init_syms[@]}"; do
  say -v "$VOICE" --file-format=m4af -o "$OUT/initial_${init_syms[$i]}.m4a" "${init_hanzi[$i]}"
done

# 韵母：符号=本音汉字（文件名里 ü → v）
fin_syms=(a o e i u v ai ei ui ao ou iu ie ve er an en in un vn ang eng ing ong)
fin_hanzi=(阿 噢 鹅 衣 乌 迂 哀 诶 威 凹 欧 优 耶 约 儿 安 恩 因 温 氲 肮 亨 英 翁)
# 用 Flo 语音的韵母（这些韵母用 Tingting 读单字会抖动，Flo 更平稳）
FLO_FINALS="a vn"
for i in "${!fin_syms[@]}"; do
  sym="${fin_syms[$i]}"
  voice="$VOICE"
  case " $FLO_FINALS " in *" $sym "*) voice="Flo (中文（中国大陆）)";; esac
  say -v "$voice" --file-format=m4af -o "$OUT/final_$sym.m4a" "${fin_hanzi[$i]}"
done

echo "完成，共 $(ls "$OUT" | wc -l | tr -d ' ') 个文件：$OUT"
