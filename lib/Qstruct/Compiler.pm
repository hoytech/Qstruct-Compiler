package Qstruct::Compiler;

our $VERSION = '0.100';

use strict;
use File::ShareDir;

use Qstruct::Compiler::LibqstructHeaders;

sub lol {
  return "OMFG " . File::ShareDir::module_dir('Qstruct::Compiler::LibqstructHeaders');
}

1;



__END__

=encoding utf-8

=head1 NAME

Qstruct::Compiler - Compiler for Qstructs

=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 SEE ALSO

L<Qstruct::Compiler github repo|https://github.com/hoytech/Qstruct-Compiler>

=head1 AUTHOR

Doug Hoyte, C<< <doug@hcsw.org> >>

=head1 COPYRIGHT & LICENSE

Copyright 2014 Doug Hoyte.

This module is licensed under the same terms as perl itself.
