# ObjectScript Examples
1. forked https://github.com/intersystems-community/objectscript-docker-template.git
2. added [ObjectScript Tutorial](https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=TOS_intro)
3. added [sc.rest Tutorial and Sample Application: Contact List](https://github.com/intersystems/isc-rest/blob/main/docs/sample-phonebook.md#iscrest-tutorial-and-sample-application-contact-list)

```
$ iris session iris
USER>zpm
zpm:USER>install isc.rest
zpm:USER>load -dev /home/irisowner/dev/src/samples/phonebook
```
## Try out the CRUD operations
From your REST client, try the following:

To allow unauthenticated access for this sample, you must give the web application the %All role. To do this:
- Click Save, then the Application Roles tab.
- Select the %All role from the Available roles.
- Click the right arrow (select) button to move the %All role to the Selected roles.
- Click the Assign button.

In Postman:
Set the "Accept" header to "application/json"
Set the "Content-Type" header to "application/json"
POST a JSON body of `{"name":"Flintstone,Fred"}` to `/csp/user/phonebook-sample/api/contact`
PUT a JSON body of `{"name":"Rubble,Barney"}` to `/csp/user/phonebook-sample/api/contact/1`
`GET /csp/user/phonebook-sample/api/contact/1` - you should see the result of the change you just made.
