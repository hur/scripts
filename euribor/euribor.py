import pandas as pd
import matplotlib.pyplot as plt
import json
import matplotlib.dates as mdates

# Initialize plot
fig, ax = plt.subplots()
plt.axes(title='Euribor')
plt.xlabel('Dates')
plt.ylabel('Rates / %')



# Plot 3 month Euribor data
with open('3m.json', 'r') as file:
    data = json.loads(file.read())
dates = [i['date'] for i in data]
rates = [i['rate'] for i in data]
df = pd.DataFrame({'dates':dates, 'rates':rates})
df['dates']  = [pd.to_datetime(i) for i in df['dates']]
plt.plot(dates, rates, 'b')

# Plot 12 month Euribor data
with open('12m.json', 'r') as file:
    data2 = json.loads(file.read())
dates = [i['date'] for i in data2]
rates = [i['rate'] for i in data2]
df = pd.DataFrame({'dates':dates, 'rates':rates})
df['dates']  = [pd.to_datetime(i) for i in df['dates']]
plt.plot(dates, rates, 'g')

# Try to format time axis ticks. 
# The issue is that set_major_locator() and set_major_formatter() do nothing
ax.xaxis.set_major_locator(mdates.YearLocator())
ax.xaxis.set_major_formatter(mdates.DateFormatter('%d-%m-%Y'))
fig.autofmt_xdate() # Rotation


# Display legend & show plot
plt.legend(labels=('3M', '12M'))
plt.show()

