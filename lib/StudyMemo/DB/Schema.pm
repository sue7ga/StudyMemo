package StudyMemo::DB::Schema;
use strict;
use warnings;
use utf8;

use Teng::Schema::Declare;

base_row_class 'StudyMemo::DB::Row';

table {
    name 'member';
    pk 'id';
    columns qw(id name);
};

table {
   name 'book';
   pk 'id';
   columns qw(id title url artistName itemurl); 
};

1;
