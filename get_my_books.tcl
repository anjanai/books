# Visit https://play.google.com/books
# Show all
# GO ALL THE WAY TO THE END
# Inspect element and get the div.
set html my_books.html
set f [open $html]
set lines [read $f]
close $f

set list [regexp -all -inline {href="/books/reader.*?" title="[^"]*?"} $lines]
#puts $list
puts <ol>
foreach {i j k} $list { 		# we seem to have three instances of href for each book
    set title [lindex [split $i =] end]
    set title [string trim $title {"}]
    puts "<li><a $i>$title</a>"
}
puts </ol>

