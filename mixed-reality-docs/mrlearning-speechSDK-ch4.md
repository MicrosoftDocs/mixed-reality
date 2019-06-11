## Lesson 4

In chapter 4, we will explore the Speech service’s Intent feature.  We will set up our Azure LUIS Portal, setup our Intent/Entities/Utterances, publish our Intent Resource, connect our Unity app to our Intent Resource, and make our first Intent API call.

1. Allow your machine to enable Dictation, to do this, go to Windows Settings, select "privacy," then "speech," and finally "inking & typing" and turn on speech services and typing suggestions.

![Module4Chapter4step1aim](images/module4chapter4step1aim.PNG)

![Module4Chapter4step1bim](images/module4chapter4step1bim.PNG)

![Module4Chapter4step1cim](images/module4chapter4step1cim.PNG)

> note: for information on how to do this on a Mac/Macbook, click [here](linkgoeshere).

2. Log in to the [Azure Portal](https://portal.azure.com/). Once you are logged in, click on Create a resource, and search for "Language Understanding," and click enter.

![Module4Chapter4step2im](images/module4chapter4step2im.PNG)

3. Select the Create button, to create an instance of this service. Name your project “Speech_SDK_Learning_Module” and select “Pay As You Go.”

![Module4Chapter4step3aim](images/module4chapter4step3aim.png)

![Module4Chapter4step3bim](images/module4chapter4step3bim.PNG)

4. Select your Region.  For the purpose of this tutorial, select "(US) West US." Then choose "F0" for the pricing tier. Now click "create" (located in the bottom left corner) to create the resource.

   >  note: once you have clicked on "create," you will have to wait for the service to be created, this might take a minute.

5. A notification will appear in the portal once the Resource is created. Click on this notification and select "Go to resource."

![Module4Chapter4step5im](images/module4chapter4stepim.PNG)

6. From the "Quick Start" page of your "LUIS API" service, navigate to the first step, grab your "keys," and click "keys" (you can also achieve this by clicking the blue hyperlink "keys," shown in the image below). This will reveal your service, "Keys." Save a copy of one of the keys so you can use it later in the app.

![Module4Chapter4step6im](images/module4chapter4step6im.PNG)

7. Back in the "Quick Start" page under Section 2, click on "Language Understanding Portal" (shown in the image above) to be redirected to the webpage which you will use to create your new service, within the LUIS application.

> note: Upon reaching the "Language Understanding Portal," you may need to login, if you are not already, with the same credentials as your Azure portal. If this is your first time using LUIS, you will need to scroll down to the bottom of the welcome page, to find and click on the "Create LUIS" app button.

8. Once logged in, click My Apps (if you are not in that section currently). You can then click on Create new app. Name the new app “Speech SDK Learning Module.” Add “Speech SDK Learning Module" to the description field, as well. Then click "done."

![Module4Chapter4step8aim](images/module4chapter4step8aim.PNG)

![Module4Chapter4step8bim](images/module4chapter4step8bim.PNG)

> note: If your app is supposed to understand a language different from English, you should change the "Culture" to the appropriate language.

9. Click “Build” located in the top right.

10. Under App Assets on the left, select “Intents” then click “Create New Intent” and name it “PressButton.” 

![Module4Chapter4step10im](images/module4chapter4step10im.PNG)

> note: it is important to use the names of Intents and Entities used in this tutorial because the Lunarcom app will be referencing them by name.  For other projects, naming conventions can be whatever you choose. 
>
> note: you should now have 2 Intents - “PressButton” and “None."

11. Under App Assets on the left, select “Entities” and click “Create New Entity” and name it “Action” and keep the Entity Type as “Simple.”

![Module4Chapter4step11im](images/module4chapter4step11im.PNG)

12. Click “Create New Entity” again and name it “Target” and keep the Entity Type as “Simple” as well.

![Module4Chapter4step12im](images/module4chapter4step12im.PNG)

1. Under App Assets on the left, select **Intents**
2. Click on your **PressButton** Intent
3. Click on the **View options** dropdown on the right and select **Show entity values**
4. Click on the “Enter an example…” textbox and enter the following 10 Utterances![img](https://lh4.googleusercontent.com/avdLMOXaDZSVAb7cEoLkvety7CdLOvYbrMO6Ru30JxLsYgLhDBumoWdHLBWLaEit0kyRJm7sq48zgLfJXGfdDmVL-isnLy16HmaIV1mLl_BdEXg3Qeu1lPckWt9gS1ILehld5cPp)
5. Click on the **View options** dropdown on the right and select **Show entity names**
6. Ensure that each of the 10 Utterances have the following Entity labels in the following places by 1) clicking on words that are mislabeled and, in the popup, selecting **Remove label** and 2) clicking on words that should be labeled and, in the popup, selecting the appropriate label.![img](https://lh3.googleusercontent.com/6tiFwohT_UgPvUPLmtt_wFrhaPDU7k32nx7_JmvUGdocsxdrSsKpOYvHJ-KHtsn-azl3V33efGX-_Af89_Dyj1m1wOFDB2slBUjk2sS5hbQdewzPwxQ5asfBQptfD5mn6hdt1_Bu)

### Publish model

1. Click **Train** in the top right
2. Once it has finished processing, click **Test** in the top right
3. Enter in “select the launch button”
4. *Note that we did not add “select” as an Action in any of our Utterances - but if you click on “Inspect”, the model recognized “select” as an Action entity.*
5. Click **Publish** in the top right
6. Ensure the dropdown says “Production” and click **Publish** on the popup
7. Once published, a green bar should appear at the top of the page.  Click on the green bar to be taken to **Manage**
8. Click on **Keys and Endpoints** under “Application Settings” to the left
9. Set the drop down *Publish To* as Production.
10. Set the *Timezone* to your time zone.
11. Check the box Include all predicted intent scores.
12. Click on **Assign resource**
13. Select tenant from the dropdown
14. Select “Pay-as-you-go” in the Subscription Name dropdown
15. Under LUIS resource name, choose the Resource that we created above
16. Click on **Assign resource** on the popup
17. Copy and save the Endpoint url associated with the Resource we just assigned so that it is easily accessible for the next section.

### Add the LunarcomIntentRecognizer component to the Lunarcom

1. Open our app in Unity
2. Select the Lunarcom_Base object in the hierarchy
3. Click “Add Component” in the inspector
4. Search for and select “LunarcomIntentRecognizer”
5. In the Luis Endpoint field of the LunarcomIntentRecognizer in the Inspector, enter the Endpoint url that we saved in the previous section

### Run and test the application

1. In the LunarcomOfflineRecognizer component in the Inspector, make sure that “Disable” is selected for SimulateOfflineMode.
2. Press the Play button in the Unity Editor
3. Click the Rocket button to start intent recognition
4. Utter the phrase “select the launch rocket button”
5. *Note: note that the app recognized the desired function and deactivated the rocket button.**![img](https://lh3.googleusercontent.com/l2y9tMzpQmBgnUip8ksgA3foK4qyN-upCnVHPFkL8wYW3DdKiQ5FOLDadJMIZtaLc8RGnTV0JFYxIDAR35UYmgQ2izc18VR9sb1mSCQUsX2IDumEZJyI39yvt-oH4c8SV7NtfQ8D)*
6. Press the Play button to stop the app

## Congratulations

[Next Lesson: ASA Lesson 4](mrlearning-base-ch4.md)

