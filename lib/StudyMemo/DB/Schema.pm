package StudyMemo::DB::Schema;
use strict;
use warnings;
use utf8;

use Teng::Schema::Declare;

base_row_class 'StudyMemo::DB::Row';

table {
    name 'user';
    pk 'id';
    columns qw(id name email password password_check);
};

table {
   name 'book';
   pk 'id';
   columns qw(id title url artistName itemurl); 
};

table{
    name 'booklist';
    pk 'id';
   columns qw(id title url user_id);
};

1;
