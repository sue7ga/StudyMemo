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

sub insert_log{
 my($self,$param) = @_; 
 $self->insert('log',$param);
}

sub get_search_book{
 my($self) = @_;
 my @items = $self->search('book',+{},+{});
}

sub delete_all_data{
 my ($self) = @_;
 $self->delete('book');
}

sub search_book{
 my($self,$bookurl) = @_;
 my $book = $self->single('book',+{url => $bookurl});
 return $book;
}

sub insert_booklist{
 my($self,$url,$title,$userid) = @_;
 $self->insert('booklist',{user_id => $userid,url => $url ,title => $title});
}

sub insert_user{
 my($self,$param) = @_;
 $self->insert('user',$param);
}

sub get_user{
 my($self,$email) = @_;
 my $user = $self->single('user',+{email => $email});
 return $user;
}

sub get_booklists{
 my($self,$userid) = @_;
 my @books = $self->search('booklist',+{user_id => $userid},+{});
 return @books;
}

sub get_booklist_by_userid_and_id{
 my($self,$userid,$id) = @_;
 my $book = $self->single('booklist',+{user_id => $userid,id => $id});
 return $book;
}

1;
