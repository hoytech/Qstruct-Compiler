use strict;

use ExtUtils::MakeMaker;

use File::ShareDir::Install;
install_share module => 'Qstruct::Compiler::LibqstructHeaders' => 'libqstruct/qstruct/';
install_share module => 'Qstruct::Compiler::Formats' => 'formats/';


my %args = (
    NAME => 'Qstruct::Compiler',
    VERSION_FROM => 'lib/Qstruct/Compiler.pm',
    EXE_FILES => [ 'bin/qstructc', ],
    CONFIGURE_REQUIRES => {
      'File::ShareDir::Install' => 0,
    },
    PREREQ_PM => {
      'Qstruct' => 0,
      'Template' => 0,
      'File::ShareDir' => 0,
    },
    LIBS => [],
    DEFINE => '',
    LICENSE => 'perl',
);


my $eummv = eval ($ExtUtils::MakeMaker::VERSION);
if ($eummv >= 6.45) {
    $args{META_MERGE} = {
        resources => {
            repository => 'git://github.com/hoytech/Qstruct-Compiler.git',
            bugtracker => 'https://github.com/hoytech/Qstruct-Compiler/issues',
        },
    };
}

WriteMakefile(%args);

{
package
MY;
use File::ShareDir::Install qw(postamble);
}
