#include <regex>
#include <stdexcept>
#include <string>

#include "name-card.h"

using namespace std;

const regex name_pattern ("[ A-Za-z]+");
const regex phone_pattern ("[-0-9]+");
// This should be good enough I guess?
const regex email_pattern ("(\\w+)(\\.|_)?(\\w*)@(\\w+)(\\.(\\w+))+");

void
NameCard::set_name (string s)
{
  // I miss Raku so much
  smatch m;
  if (!regex_match (s, m, name_pattern))
    throw invalid_argument{"invalid name"};
  name = s;
}

void
NameCard::set_phone (string s)
{
  smatch m;
  if (!regex_match (s, m, phone_pattern))
    throw invalid_argument{"invalid number"};
  phone = s;
}

void
NameCard::set_email (string s)
{
  smatch m;
  if (!regex_match (s, m, email_pattern))
    throw invalid_argument{"invalid name"};
  email = s;
}

NameCard::NameCard (string n, string p, string e)
{
  set_name (n);
  set_phone (p);
  set_email (e);
}
