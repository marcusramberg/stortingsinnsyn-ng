#!/usr/bin/env perl

use Mojolicious::Lite;

__PACKAGE__->attr(db => sub {
    my $self=shift;
    return DBIx::Simple->new(app->path_to('prototype.db'));
});

get '/' => sub {
  my $self = shift;
  $self->render('index');
  $self->db
} => 'index';


get '/person/:person_id' => sub {
    my $self = shift;
}

get '/division/:division_id' => sub {
    my $self = shift;
}


app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title 'Velkommen';
Welcome to Mojolicious!

@@ layouts/default.html.ep

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
<html> 
<head> 
<title>Valgt av folket - <%= title %></title> 
</head> 
<body> 
<p><a href="<%= url_for('index')%>">Valgt av folket</a> | <a href="http://www.nuug.no/">Foreningen NUUG</a></p>
<%= content %>
<hr /><p>Inspirert av <a href="http://www.publicwhip.org.uk/">Public Whip</a> og <a href="http://www.theyworkforyou.com/">TheyWorkForYou</a>.  Kontakt <a href="http://www.hungry.com/~pere/">Petter Reinholdtsen</a> hvis du vil bidra.</p> 
</body></html>
