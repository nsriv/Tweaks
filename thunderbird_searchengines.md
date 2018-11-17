#   Procedure for Editing Search Engine in Thunderbird 60+
##  Tested Using
*   Thunderbird 60.3.1 (32-bit) Release Channel
*   Firefox 62.0b9 (64-bit)
*   Windows 10 Home 64-bit

##  Notes
We will be editing the search engine file from Thunderbird to create entries for the new search engines to add to our installation of Thunderbird.

There are two ways to do this depending on how comfortable you are with JSON editing in your favorite text editor. I'll only be detailing the GUI method with Firefox, but the JSON method is to navigate to the file, save it as a JSON instead of a .mozlz4 file, edit it, save and replace/overwrite the old file.

I was specifically concerned with adding DuckDuckGo and Google Search into Thunderbird, but the possibilities are endless.

Please allow for differences based on Operating System, and read through the directions once thoroughly before attempting because I really do not want to be responsible for any damage or data loss.

##  Method 1: Using Firefox
1.  Download the Firefox add-on "mozlz4-edit" from https://addons.mozilla.org/en-US/firefox/addon/mozlz4-edit/
2.  In Windows Explorer, press Win+R (or open run command from start menu)
3.  In "Open:" prompt paste the following:
~~~
        %APPDATA%\Mozilla\Thunderbird\Profiles\
~~~
4.  Hit enter, and click into the folder named according to the convention: <string.profile_name> and find the file named "search.json.mozlz4"
5.  Copy this file and paste it to the desktop. This is temporary and all edits will be made to the COPY.
   *    This is a good opportunity to create a new folder inside the Thunderbird profile (call it <search_backup> or something similar and put the original "search.json.mozlz4" file in it, thus preserving the file in the unlikely event that you make a mistake in the next steps and want a way to quickly revert your changes.)
6.   Open the Firefox add-on we downloaded earlier
7.   Select "Open file" from top left, select the search engine file we placed on the desktop, and open it.
8.   Code formatted as JSON should open. Clicking the "Add engines" button at the top, you should see search engines listed like "YandexCOM" and "DuckDuckGoCOM", accompanied with a URL which will receive search terms, and a field in which to insert a favicon for your favorite search engine. 
9.   I sought to add DuckDuckGo and Google as search engines to my installation of Thunderbird. Note that Google has its own tab to select in the extension. To add DuckDuckGo, I changed the name from "DuckDuckGoCOM" to simply "DuckDuckGo" and inserted the favicon URL:
~~~
https://duckduckgo.com/favicon.ico
~~~
10.  To add Google I simply changed the name from "GoogleCOM" to "Google" and inserted the favicon URL:
~~~
https://www.google.com/s2/favicons?domain=www.google.com
~~~

11.  Once these edits have been made, X out of the search engine panel, and select "Save as mozlz4" in top menu. You should see the Firefox Download Manager pulse, and the file you find there is your new search engine file.
12.  Move this new file into the Thunderbird Profiles folder, hopefully not overwriting the old file. (you made a copy and backed it up in Step 5 right? If you didn't, the file on your desktop should remain unchanged and this is your new backup. You're welcome.)
13.  Close Explorer and restart Thunderbird. 
14.  Once Thunderbird has started up again, go to Options and you should see your added search engines with favicons in the dropdown menu to select your default. 
15.  Enjoy a feature that should really have a clean GUI in the Options menu anyways!

##  Method 2: JSON Editing
If you're here, you probably know what to do already, so here's the code to insert under "engines" in the JSON file to add DuckDuckGo and Google to Thunderbird Search.
~~~
{
            "_name": "DuckDuckGo",
            "_shortName": "DuckDuckGo",
            "description": "DuckDuckGo",
            "queryCharset": "UTF-8",
            "_readOnly": "false",
            "__searchForm": "",
            "_iconURL": "https://duckduckgo.com/favicon.ico",
            "_loadPath": "[other]/DuckDuckGo.xml",
            "_metaData": {},
            "_urls": [
                {
                    "template": "https://duckduckgo.com/?q={searchTerms}",
                    "rels": [],
                    "resultDomain": "",
                    "params": []
                }
            ]
        },
        {
            "_name": "Google",
            "_shortName": "Google",
            "description": "Google",
            "queryCharset": "UTF-8",
            "_readOnly": "false",
            "__searchForm": "",
            "_iconURL": "https://www.google.com/s2/favicons?domain=www.google.com",
            "_loadPath": "[other]/Google.xml",
            "_metaData": {},
            "_urls": [
                {
                    "template": "https://www.google.com/search?q={searchTerms}",
                    "rels": [],
                    "resultDomain": "",
                    "params": []
                }
            ]
        }
~~~