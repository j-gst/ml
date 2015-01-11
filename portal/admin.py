from django.contrib import admin

# Register your models here.
# Beate 02.01.2015
from portal.models import *

class AuthorAdmin(admin.ModelAdmin):
    model = Author
    #list_display('lastname', 'firstname')

    def lastname(self):
        return self.Author.lastname
    lastname.short_description = 'Nachname'

class BookAdmin(admin.ModelAdmin):
    model = Book

    #list_display('title')
    def title(self):
        return self.title
    title.short_description = 'Titel'

admin.site.register(Author, AuthorAdmin)
admin.site.register(Book, BookAdmin)
#end Beate 02.01.2015
# nicht richtig funktionell