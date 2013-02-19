## Example R2
## create a MARC::Batch object.
#!/usr/bin/perl
use strict;
use warnings;
use MARC::Batch;
binmode(STDOUT, ":utf8");
my $batch = MARC::Batch->new('USMARC',*STDIN);
while (my $record = $batch->next()) {
    my @fields = $record->fields();
    foreach my $field (@fields) {
        my $field_strip = $field->as_string();
        $field_strip =~ s/[\n\t]/ /g;
        print $field->tag(),":",$field_strip,"\t";
    }
    print "\n";
}
if ( my @warnings = $batch->warnings() ) {
    print STDERR "\nWarnings were detected!\n", @warnings;
}
