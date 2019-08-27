import pandas as pd
import matplotlib.pyplot as plt
import json
import matplotlib.dates as mdates
from matplotlib.ticker import FormatStrFormatter, PercentFormatter
from pandas.plotting import register_matplotlib_converters
register_matplotlib_converters()
# Initialize plot
fig, ax = plt.subplots()
plt.gcf().canvas.set_window_title('Euribor rates')
fig.set_size_inches(10, 8)
plt.axes(title='Comparison of 3 & 12 Month Euribor rates from 1999 to 2017')
plt.xlabel('Dates')
plt.ylabel('Rates')



# Plot 3 month Euribor data
with open('3m.json', 'r') as file:
    data = json.loads(file.read())
dates = [i['date'] for i in data]
rates = [i['rate'] for i in data]
df = pd.DataFrame({'dates':dates, 'rates':rates})
df['dates']  = [pd.to_datetime(i) for i in df['dates']]
plt.plot(df['dates'], df['rates'], 'b')

# Plot 12 month Euribor data
with open('12m.json', 'r') as file:
    data2 = json.loads(file.read())
dates = [i['date'] for i in data2]
rates = [i['rate'] for i in data2]
df = pd.DataFrame({'dates':dates, 'rates':rates})
df['dates']  = [pd.to_datetime(i) for i in df['dates']]
plt.plot(df['dates'], df['rates'], 'g')

# Format time axis
plt.gca().xaxis.set_major_locator(mdates.YearLocator())
plt.gca().xaxis.set_major_formatter(mdates.DateFormatter('%Y'))
plt.gca().yaxis.set_major_formatter(PercentFormatter())
plt.gca().xaxis.set_minor_locator(mdates.MonthLocator())
#plt.gca().xaxis.set_minor_formatter(mdates.DateFormatter('%b'))
fig.autofmt_xdate(which='both')
plt.tight_layout()

# Display legend & show plot
plt.legend(labels=('3 Month Euribor', '12 Month Euribor'))
plt.show()

