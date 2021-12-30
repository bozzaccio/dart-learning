lcov=$(which lcov)

if [ -z "$lcov" ]
then
    echo "Preparing enviroment.."
    ## Debian/Ubuntu env
    apt install lcov
else
    echo "LCOV already installed.."
fi

export PATH="$PATH":"$HOME/.pub-cache/bin"

## Run Dart tests and output them at directory `./coverage`:
dart run test test/ --coverage=./coverage

## Activate pacakge `coverage` (if needed):
dart pub global activate coverage

## Format collected coverage to LCOV (only for directory "lib")
dart pub global run coverage:format_coverage --packages=.packages --report-on=lib --lcov -o coverage/lcov.info -i coverage

## Generate LCOV report:
genhtml -o coverage/report coverage/lcov.info

## Open the HTML coverage report:
open coverage/report/index.html