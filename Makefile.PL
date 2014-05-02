use strict;

use ExtUtils::MakeMaker;


my %args = (
    NAME => 'Qstruct::Compiler',
    VERSION_FROM => 'lib/Qstruct/Compiler.pm',
    PREREQ_PM => {
      'Template' => 0,
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
