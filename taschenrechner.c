#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
//------------------------------------------------------------------------------
char* search_clam(char *str, int len);
void operator_search(char *ptr_str_start,int len);
int calculate_operator(char operator,char ptr_left_value,char ptr_right_value);
void erase_expression(int result,char* ptr_operator);
//-----------------------------------------------------------------------------
//Driver Program
int main (void)
{
  char math_str[100];
  int str_length;


  printf("Bitte geben Sie eine Formel ein:\n");
  scanf("%s",math_str);
  str_length = strlen(math_str);

  printf("%s",search_clam(math_str,str_length));

  return 0;

}
//Driver Program
//-----------------------------------------------------------------------------
//Funktion for Klammern suche
char* search_clam(char *str, int len)
{
  int len__between_klammern;

  for(int i = 0; i < strlen(str);i++)
  {
    printf("[DEBUG]Adresse:%p\n",str+i);
    if(str[i] == '(')
    {
      printf("'(' gefunden\n");
      search_clam(&str[i+1],strlen(str+i+1)); //Rekursiv aufruf ab dem ersten Klammern öffnen fund
      //printf(" '(' gefunden an %p strlen: %lu \n",&str[i],strlen(str+i));
    }
    else if( str[i] == ')')
    {
      len__between_klammern=strlen(str)-strlen(str+i); //Übergabe der länge des Abstandes zwischen den Klammern an operator-search
      printf("')' gefunden\n");// innerhalb des Ausdrucks wird nach den Operatoren gesucht (......)
      operator_search(str,len__between_klammern);
    }
  }

  return str;
}
//------------------------------------------------------------------------------
void operator_search(char *ptr_str_start,int len) // Funktion sucht nach den Operatoren innerhalb der Klammern
{ //3+6*(7+4)+4
  char operator_list[] = {'^',':','*','+','-'}; // Operator Ranking es wird zuerst nach Potenzieren gesucht
  char *ptr_operator_search = ptr_str_start;

  //printf("%c",*ptr_str_start++);
  for(int k = 0;k < 5;k++)
  {
    for(int i = 0;i < len;i++)
    {
      if(ptr_operator_search[i] == operator_list[k])
      {
        //printf("[DEBUG]als %d. gefunden: %c\n",k,ptr_operator_search[i]);
        printf("%d\n",calculate_operator(operator_list[k],ptr_operator_search[i-1],ptr_operator_search[i+1])); //Linken Wert und Rechten nehmen Wert

      }
    }
  }
}

//------------------------------------------------------------------------------
int calculate_operator(char operator,char left_value,char right_value)
{
  int result = 0; //Ergebnis
  int a = left_value - '0'; //Convertieren der Char in Int
  int b = right_value - '0';
  printf("[DEBUG]%d %c %d\n",a,operator,b);

  switch(operator) // Berechnen der Fälle
  {
    case '^':
        result = (int)pow(a,b);
        break;
    case ':':
        if(b == 0)
        {
          printf("DIV ERROR");
          exit(1);
        }
        else
        {
          result=a / b;
        }
        break;
    case '*':
        result =a * b;
        break;
    case '+':
        result = a + b;
        break;
    case '-':
        result = a - b;
        break;
    default:
    ;
  }

  return result;
}

void erase_expression_from_string(int result,char* ptr_operator)
{
  
}
