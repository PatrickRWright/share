# [Humanizing Peer Reviews](https://www.processimpact.com/articles/humanizing_reviews.pdf)

"We have to overcome the ingrained culture ofindividual achievement and embrace the value of collaboration."

"When you have internalized the benefits of peerreviews, you won’t feel comfortable unless someone else carefully examines any significantdeliverable you create."

# Working together
* "Peer review—an activity in which people other than the author of a software deliverableexamine it for defects and improvement opportunities—is one of the most powerful softwarequality tools available."
* "Many of the barriers to successful peer reviews are social and cultural in nature, not technical."
* "Asking your colleagues to point out errors in your work is a learned—not instinctive—behavior. ... Holding successful peer reviews requires us to overcome this naturalresistance to outside critique of our work."
* "Egoless programming enables an author to step back and let others point outplaces where improvement is needed."
* "Having a co-worker locate a defect is regarded as a “good catch,” not a personal failing."

# Tips for reviewers
* "The ways in which reviewers speak to authors indicate whether their culture favors respectful collaborationor competitive antagonism."
* "Bugsare the bad guys in a review, not the author or the reviewers."
* "The leaders of the review initiativeshould strive to create a culture of constructive criticism, in which team members seek to learnfrom their peers and do a better job the next time."

# Barriers
* "Some developers and project managersdon’t think their project is large enough or critical enough to need reviews, yet any piece of workcan benefit from an outside perspective."
* "The fear of managementretribution if defects are discovered can make an author reluctant to let others examine his work."
* "There’s an implication that ifyou need help, then you must not be very smart. Therefore, it’s not surprising that developersoften resist asking for help through reviews."
* "People who don’t want to do reviews will expendconsiderable energy explaining why reviews don’t fit their culture, needs, or time constraints."

# Overcoming resistence
* "Lack of knowledge is easy to correct if people are willing to learn."
* "The attitudes and behaviors that managers exhibit affect how well reviews will work inan organization."
* "However, managers must notevaluate individuals based on the number of defects found during reviews."

# Communication examples

## Good
“I didn’t see where these variables were initialized”  
“This specification is missingSection 3.5 from the template”  

## Bad
“You didn’t initialize thesevariables”  
“You left out section 3.5.”   
“How in the world have you managed to...”  

# [How to Do Code Reviews Like a Human](https://mtlynch.io/human-code-reviews-1/)

* "Never say “you”"
* "If you lighten the author’s load by writing out some of the changes you’re suggesting, you demonstrate that you are generous with your time as a reviewer."
* "Tie notes to principles, not opinions"
* "a good code reviewer not only finds bugs but provides conscientious feedback to help their teammates improve."
* "Most reviewers focus only on what’s wrong with the code, but reviews are a valuable opportunity to reinforce positive behaviors."

## Style
* "Once you have a style guide, you don’t have to waste review cycles arguing with the author about whose naming conventions are best. Just defer to the style guide and move on. If your style guide doesn’t specify a convention about a particular issue, it’s generally not worth arguing about. If you encounter a style issue your guide doesn’t cover and it’s important enough to discuss, hash it out with your team. Then, record the decision in your style guide so you never have to have that discussion again."
* https://google.github.io/styleguide/Rguide.html

## Review speed
* "The absolute maximum turnaround on a review round should be one business day. If you’re struggling with a higher-priority issue and can’t complete a round of review in under a day, let your teammate know and give them the opportunity to reassign it to someone else. If you’re forced to decline reviews more than about once per month, it likely means that your team needs to reduce its pace so that you can maintain sane development practices."

# Specifics in R
* "Starting your code with an annotated description of what the code does when it is run will help you when you have to look at or change it in the future. Just one or two lines at the beginning of the file can save you or someone else a lot of time and effort when trying to understand what a particular script does."
* Load all dependencies at the top of the script to avoid road bumps further down the code.
* Define all paths input files at the top of the code in variables.
* Group your functions together.
* Use comments to mark off sections of code.
* Name and style code consistently (lint).
* Break code into small, discrete pieces.
* Factor out common operations rather than repeating them. (DRY)
* Run tests of your own (assertthat)
* As robust as possible to changes in the data (specify by name not by number)
* define logical chunks
* define a timeframe for the review (e.g. 2h) The better your code can be read the more will be reviewed.
If not everything can be reviewed in the timeframe then that is how it is.

https://docs.google.com/document/d/1OYcWJUk-MiM2C1TIHB1Rn6rXoF5fHwRX-7_C12Blx8g/edit#heading=h.dyoxrtoo15mm  
https://swcarpentry.github.io/r-novice-inflammation/06-best-practices-R/  
https://devguide.ropensci.org/reviewerguide.html
https://mtlynch.io/human-code-reviews-1/  
https://ropensci.org/commcalls/2018-10-16/  
