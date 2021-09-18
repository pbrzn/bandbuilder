# BANDBUILDER

BANDBUILDER is a Rails app centered around building bands for gigs.

## Usage

Fork and clone this repo. Execute 'bundle install' in your terminal then engage the rails server. Sign-up as either a Musician or Music Director.
  * Music Directors can create/update/delete gigs and book musicians
  * Musicians can audition for gigs

Use the Nav Bar to navigate the app. You can view all Musicians, Music Directors, Gigs, Instruments, and Genres of Gigs.

### Musicians

When you sign up as a Musician, choose your Instrument and input your desired Pay Rate.

If a gig has an open slot for your instrument, you will have the ability to "audition" for a gig. Simply click the "Click Here To Audition" button, and this will send a notification to the gig's Music Director of your audition. The Music Director will then either "book" you for the gig, or decline your services. In either case you will receive a message on the Gig's show page expressing to you whether or not you got the gig.

### Music Directors

To create a gig, simply click "Create New Gig", fill in the form and choose the instruments you would like to be played by your band.

To book musicians, click "Edit Gig/Book Musicians", and choose which Musicians you would like to add to your band. If you have musicians "auditioning" for your gig, you may choose to decline a Musician's services by clicking the "Decline Services" button – which notifies the user that they did not get the gig – otherwise simply add the musician by checking off their name in the Gig's edit page.
