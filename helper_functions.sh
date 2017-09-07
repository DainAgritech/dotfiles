

key()
{
  pwgen -cnB ${1:-8}
}

password()
{
  pwgen -cnyB ${1:-15}
}

find_size()
{
  find . -iname "$1" -exec du -kc {} + | grep total$ | cut -f1 | awk '{ sum+=$1} END {print sum*1024}' | nft
}

pc()
{
  pandoc -s --standalone --toc -f markdown --highlight-style zenburn --template ~/dotfiles/pandoc/template.html -t html "$1" | sed 's/<table/<table class=\"table\"/' > "${1%.*}.html"
}

pc_print()
{
  pandoc -s --standalone --toc -f markdown --highlight-style haddock --template ~/dotfiles/pandoc/template.html -t html "$1" | sed 's/<table/<table class=\"table\"/' > "${1%.*}.html"
}

fetch_markdown()
{
  curl --data "read=1" --data "u=$1" "http://fuckyeahmarkdown.com/go/"
}

convertTime()
{
  date -d @$(echo $1) +"%Y-%m-%d %T"
}

convertMilli()
{
  convert $(echo $1 | rev | cut -c 4- | rev)
}

print_all_them_colors()
{
  for x in 0 1 4 5 7 8; do
    for i in `seq 30 37`; do
      for a in `seq 40 47`; do
        echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
      done
      echo
    done
  done
  echo ""
}

tmp()
{
  if [ -d "$HOME/tmp" ]; then
    cd $HOME/tmp
  else
    if [ -d "$TMPDIR" ]; then
      cd $TMPDIR
    else
      cd /tmp
    fi
  fi
  pwd
}

qr_code()
{
  qr "$1" > "$1.png"
  open "$1.png"
}

tm()
{
  convertmilli $1 | pbcopy
}
t()
{
  convert $1 | pbcopy
}