PSYCOPG2_TAG="$(/usr/bin/awk -F '==' '{ gsub(/\./, "_", $2) ; print $2 }' requirements.txt)"
/usr/bin/git clone --branch "${PSYCOPG2_TAG}" --depth 1 https://github.com/psycopg/psycopg2.git
cd psycopg2 || exit
/usr/local/bin/python setup.py bdist_wheel
