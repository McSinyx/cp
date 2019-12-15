#include <string>

using namespace std;

class NameCard
{
  string name;
  string phone;
  string email;
public:
  string get_name () { return name; }
  string get_phone () { return phone; }
  string get_email () { return email; }
  void set_name (string);
  void set_phone (string);
  void set_email (string);
  NameCard (string, string, string);
};
