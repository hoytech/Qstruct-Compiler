package Qstruct::Compiler::Formats::cpp;

use strict;


our $template = <<'END_OF_TEMPLATE';
#pragma once

// C++ interface for [% schema_filename %] (sha1: [% schema_sha1 %])
// Compiled by Qstruct::Compiler [% qstruct_compiler_version %]

[% FOREACH def IN defs %]

// [% def.name %]

class [% def.name %]::Accessor {
  public:

  [%- FOREACH item IN def.items -%]
    [% IF item.type == 'uint64' %]

    uint64_t [% item.name %];

    inline uint64_t [% def.name %]::Accessor::[% item.name %]() {
      QSTRUCT_GETTER_PREAMBLE(8)
      //FIXME:  if (rv) throw Exception("[% def.name %]::Accessor::[% item.name %] failed");

      if (exceeds_bounds) return 0; // default value

      uint64_t output;

      QSTRUCT_LOAD_8BYTE_LE(p + [% item.byte_offset %], output);

      return output;
    }
    [% ELSIF item.type == 'double' %]
    // [% item.name %] - is a double
    [% ELSE %]

    // [% item.name %] - Unknown type: [% item.type %]
    [%- END -%]
  [%- END -%]


  private:
    char *p;
    size_t len;
};

class [% def.name %]::Builder {
};

[% END %]
END_OF_TEMPLATE


1;












__END__



EXAMPLE USAGE:


#include "MyPkg/User.h"



---- loader


char *a;
size_t size;

MyPkg::User::accessor u(a, size);

uint64_t id = u.id();

std::string name = u.name();
u.name([] (char *p, size_t len) {
  // pointer valid here only
});


u.sha256_hash([] (uint8 *p, size_t num_elems) {
});




u.emails([] (char *p, size_t len) {
});

u.emails([] (std::string email) {
});

u.phones([] (MyPkg::PhoneNumber::accessor &phone) {
  std::string number = phone.number();
});



---- builder


MyPkg::User::builder u;

u.name(char *p, size_t len);
u.name(std::string &);

u.emails(std::vector<std::string> &);

u.phones(std::vector<MyPkg::PhoneNumber::builder> &);
