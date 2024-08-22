function gb_recent --wraps=git\ for-each-ref\ --sort=-committerdate\ --format=\'\%\(committerdate:iso8601\)\ \%\(refname:short\)\ \%\(objectname:short\)\ \%\(subject\)\'\ refs/heads/ --description alias\ gb_recent=git\ for-each-ref\ --sort=-committerdate\ --format=\'\%\(committerdate:iso8601\)\ \%\(refname:short\)\ \%\(objectname:short\)\ \%\(subject\)\'\ refs/heads/
  git for-each-ref --sort=-committerdate --format='%(committerdate:iso8601) %(refname:short) %(objectname:short) %(subject)' refs/heads/ $argv
        
end
