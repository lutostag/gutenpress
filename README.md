An offline gutenberg catalog searcher and downloader.

syntax is as follows:
> gutenpress search '/science fiction/ && /short stories/ && !/Electronic text/'
        will show those records that contain science fiction, short stories, and are not etexts
> gutenpress numbers '5 6'
        will show the records of books 5, 6
        which should be the same as
> gutenpress search '/001:5\t/ || /001:6\t/'
        AND YES THE SINGLE QUOTES ARE NECESSARY
> gutenpress get epub numbers '7'
        will download pg7.epub to the current directory
> gutenpress get txt.utf8 search '/science/ && !/science fiction/'
        will download some non-scifi science things
> gutenpress update
        will update the catalog.tsv from the gitorious repo

you can use any awk expression pattern for a search, but dont expect all tricky quote escaping to work because it may fail.

please search before you blindly download or you may end up with a LOT of files
currently the only filetypes I want to download are {epub, mobi, plucker.pdb, qioo.jar, txt.utf8} you can allow downloading of other types by just changing the if statement on line 10 to include what you want



requires awk,sed,sh,wget,and some other normal unix utils (busybox is enough)

also a file called catalog.tsv is needed that has \t field delimiters and \n record delimiters which can be generated from a bunzip'd http://www.gutenberg.org/feeds/catalog.marc.bz2 with the following perl script gutenmarc.pl, which might be run as follows:
wget -O - http://www.gutenberg.org/feeds/catalog.marc.bz2 | bzcat | perl gutenmarc.pl > catalog.tsv

gutenmarc.pl needs the cpan module MARC::Record from http://search.cpan.org/~gmcharlt/MARC-Record-2.0.5/


also feel free to change the mirror used from gutenberg.readingroo.ms to anyother mirror that supports generated caches.
