# communi_assignment

Main points to notice:
 Used GETX obx for state management.
 
 Used controller and page scheme for each screen(only one). The only logic inside the page itself is the onScroll ,
 function, which is bounded to the screen layout so it made sesnse to keep it on the page.
 
 Used local caluclation pagination to make the app only generate objects that the user needs.
 
 Used ListView.Builder as the way to layout the infinite rows. As the widget holds only the widets on screen and dispose the rest.
 Wich is best for this kind of self growing list.

 Used 2 different main widget state builds. wraping the ListView which trrigers only when there are new numbers added to the array.
 And one wraping each NumberCell on user press on a number. So it renders only the lowest widget possible to match the users actions.

 For handling font size mismatch while the numbers keep on getting bigger , used AutoSizeText, which lower the font to 5.
 And if needed further, uses the elipses text overflow.

 Notes:
  From research, it came up that most modern mobile devices can calculate the prime equation easily until the number 1000000.
  For further development I would suggest to use a external api for a range query on prime numbers.
