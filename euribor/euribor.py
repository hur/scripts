import pandas as pd
import matplotlib.pyplot as plt
import json



fig, ax = plt.subplots()
plt.axes(title='Euribor')
plt.xlabel('Dates')
plt.ylabel('Rates / %')
# 3M
with open('3m.json', 'r') as file:
    data = json.loads(file.read())
dates = [i['date'] for i in data]
rates = [i['rate'] for i in data]
df = pd.DataFrame({'dates':dates, 'rates':rates})
df['dates']  = [pd.to_datetime(i) for i in df['dates']]
plt.plot(dates, rates, 'b')
# 12M
with open('12m.json', 'r') as file:
    data2 = json.loads(file.read())
dates = [i['date'] for i in data2]
rates = [i['rate'] for i in data2]
df = pd.DataFrame({'dates':dates, 'rates':rates})
df['dates']  = [pd.to_datetime(i) for i in df['dates']]

plt.plot(dates, rates, 'g')
plt.legend(labels=('3M', '12M'))
plt.show()

