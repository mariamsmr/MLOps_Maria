M25 DATA DRIFTING
-----------------------------------------------------------------
Data drifting is one of the core reasons for model accuracy degrades over time in production.
For ML models, data drift is the change in model input data that leads to model performance degradation

Evidently:
we are going to use the framework Evidently developed by EvidentlyAI. 
Evidently currently supports both detection for both regression and classification models.
$ pip install evidently


M26 SYSTEM MONITORING
-----------------------------------------------------------------
The key concept we are often working with here is called telemetry. Telemetry in general refer to any automatic measurement and wireless transmission of data from our application.

simply to follow the instructions in this repository:

https://github.com/duarteocarmo/dtu-mlops-monitoring

Alert system:
A core problem within monitoring is alert systems. The alert system is in charge
of sending out alerts to relevant people when some telemetry or metric we are 
tracking is not behaving as it should.

how we can setup automatic alerting:
1. Go to the Monitoring service. Then go to Alerting tab.
2. Start by setting up an notification channel.
3. Next lets create a policy. Clicking the Add Condition 
4. add the notification channel you created in one of the earlier steps
5. When the alert is setup you need to trigger it. 

(small code snippet that you can execute on your laptop to call a cloud function)

import time
import requests
url = 'https://us-central1-dtumlops-335110.cloudfunctions.net/function-2'
payload = {'message': 'Hello, General Kenobi'}

for _ in range(1000):
   r = requests.get(url, params=payload)

6. Make sure that you get the alert through the notification channel you setup.



