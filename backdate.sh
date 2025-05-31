#!/bin/bash

# Month and Year you want to fake (e.g., March 2025)
YEAR=2025
MONTH=03

# Loop over all days of the month
for DAY in $(seq -w 1 31)
do
  # Skip invalid dates
  if ! date -d "$YEAR-$MONTH-$DAY" >/dev/null 2>&1; then
    continue
  fi

  # Set the fake dates
  export GIT_AUTHOR_DATE="$YEAR-$MONTH-$DAYT12:00:00"
  export GIT_COMMITTER_DATE="$YEAR-$MONTH-$DAYT12:00:00"

  # Make a dummy change (optional)
  echo "Fake commit on $YEAR-$MONTH-$DAY" >> activity.txt

  # Commit
  git add activity.txt
  git commit -m "Backdated commit for $YEAR-$MONTH-$DAY"
done

