package StudyMemo::DB;
use strict;
use warnings;
use utf8;
use parent qw(Teng);

__PACKAGE__->load_plugin('Count');
__PACKAGE__->load_plugin('Replace');
__PACKAGE__->load_plugin('Pager');

sub insert_item{
 my($self,$url,$title,$artistname) = @_;
 $self->insert('book',+{title => $title ,url => $url}); 
}

sub get_search_book{
 my($self) = @_;
 my @items = $self->search('book',+{},+{});
}

sub delete_all_data{
 my ($self) = @_;
 $self->delete('book');
}

1;
