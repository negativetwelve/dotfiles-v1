alias fa13="cd ~/dropbox/berkeley/fa13"

alias aliases="cd ~/.yadr/zsh/aliases"
alias y="cd ~/.yadr"
alias yu="cd ~/.yadr && git pull && cd - && ar"

function ypush() {
  echo "$1";
  cd ~/.yadr;
  git add .;
  git commit -m "$1";
  git push;
  cd -;
}

# For tmux attach and creation.
alias tm="tmux attach-session -t pro || tmux new-session -s pro"

if [ `uname` '==' "Linux" ]; then
  # Ubuntu/server specific aliases.
  alias ls="ls --color=auto"
  alias tmux="$HOME/local/bin/tmux"
fi


alias run-batch="rm ~/mobile_reviews/test_2; rm ~/pg/flow_analysis/flow_analysis/data/mobile_reviews_flow_test.json; python batch/adhoc/mobile/mobile_session_analysis/mr_mobile_session_generic_data_with_dimensions.py ~/mobile_reviews/s1 > ~/mobile_reviews/test_2; cat ~/mobile_reviews/test_2 | python batch/adhoc/mobile/mobile_session_analysis/mobile_session_pprint.py --use-stdin > ~/pg/flow_analysis/flow_analysis/data/mobile_reviews_flow_test.json"

alias run-batch-orig="rm ~/logs/test_step2_1; rm ~/pg/flow_analysis/flow_analysis/data/sign_up_flow_test2.json; python batch/adhoc/mobile/mobile_session_analysis/mr_mobile_session_generic_data_with_dimensions.py ~/logs/small_1000000_2_analysis_base > ~/logs/test_step2_1; cat ~/logs/test_step2_1 | python batch/adhoc/mobile/mobile_session_analysis/mobile_session_pprint.py --use-stdin > ~/pg/flow_analysis/flow_analysis/data/sign_up_flow_test2.json"

alias run-debug="python batch/adhoc/mobile/mobile_session_analysis/mr_mobile_session_generic_data_with_dimensions.py ~/logs/small_1000000_2_analysis_base"


alias tail_aa="tools/scribereader -e dev api_analytics --tail | ~/lib/jsonq/jsonq '.analytics[*].iri'"
