# Convert output from "bq query --dry_run" to GB
BEGIN {
  B = "([0-9]+)"
  if (match($0, B)) {
    bytes = substr($0, RSTART, RLENGTH)
    gb = bytes / 1e9
    printf("%.2f GB\n", gb)
  } else {
    print "No byte size found"
  }
}
