#! /bin/bash

VAR1=$(cat <<EOF
<?xml version="1.0" encoding='UTF-8'?>
<painting>
  <img src="madonna.jpg" alt='Foligno Madonna, by Raphael'/>
  <caption>This is Raphael's "Foligno" Madonna, painted in
  <date>1511</date>-<date>1512</date>.</caption>
</painting>
EOF
)

VAR2="<?xml version=\"1.0\" encoding='UTF-8'?>
<painting>
  <img src=\"madonna.jpg\" alt='Foligno Madonna, by Raphael'/>
  <caption>This is Raphael's \"Foligno\" Madonna, painted in
  <date>1511</date>-<date>1512</date>.</caption>
</painting>"

echo "${VAR1}"
echo "${VAR2}"