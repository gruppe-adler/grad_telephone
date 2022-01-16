Telephone Functionality in Arma (heavy WIP)

![](logo_telephone_adler.png)

* requires TFAR + CBA
* will support vanilla phone booths + GM phone booths
* will support rotary and digit number phones
* connection is always A <-> B and mono-ear
* phones trying to connect to an existing connection will receive occupied signal
* easily add phone functionality to any object
* phone numbers are auto generated
* hooking into lines for agents is on the roadmap


* note current TFAR_wire model is by Saborknight
https://github.com/michail-nikolaev/task-force-arma-3-radio/pull/1530
and will be referenced correctly when his PR is merged



## Magic Variables on Phone Objects you can use

`grad_telephone_isRotary` - **BOOL**  
_If true rotary phone display is used for dialing, if false digit pad._  
Default false for non-supported objects  


`grad_telephone_hasPublicPhoneBookEntry` - **BOOL**  
_If false phone wont show up in phoneBook_  
Default true  


`grad_telephone_skipDialing` - **BOOL**  
_Skips dialing, no wait before connection is build up. Usable for e.g. Grenzmeldenetz or other direct connections._  
Default false  

`GRAD_Telephone_phoneCablePlugOffset` - **ARRAY XYZ**
_Sets position of cable plug on phone object_
Default [0,0,0]


`grad_telephone_fakeanswersound` - **ARRAY** of Sounds  
_If Array is > 0 then random sound from it is automatically played on this connection. Call ends automatically after sound._  
Default empty
