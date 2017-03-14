// 02_chapter_2/01_glist/glist.c
// Example from 21st Century C, 2nd ed.
// Chapter 2, p. 48
// gcc -g glist.c `pkg-config --cflags --libs glib-2.0` -o glist

#include <stdio.h>
#include <glib.h>

GList *list;

int main() {
    list = g_list_append(list, "a");
    list = g_list_append(list, "b");
    list = g_list_append(list, "c");

    for ( ; list != NULL; list = list->next)
        printf("%s\n", (char*)list->data);
}
