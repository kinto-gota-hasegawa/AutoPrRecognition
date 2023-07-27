#!/bin/bash

# コミット履歴からPRのタイトルとリンクを抽出する関数
extract_pr_titles_and_links() {
    echo "extract_pr_titles_and_links"
    git log --pretty=format:'%s' | \
    while read -r line; do
        title=$(echo "$line" | sed -n 's/\(.*\) (#.*/\1/p')
        pr_number=$(echo "$line" | sed -n 's/.*(#\(.*\))/\1/p')
        echo "$title"
        echo "> https://github.com/kinto-gota-hasegawa/AutoPrRecognition/pull/$pr_number"
    done
}

extract_pr_titles_and_links