# BitStat
<h1 align="center">
  The Ultimate Open Source Bitcoin Visualisation
</h1>
<center>

![](https://img.shields.io/badge/%E2%9C%94%20Code%20Quality-A-green.svg) ![](https://img.shields.io/badge/Mobile%20Compatibility-A-red.svg)
![](https://img.shields.io/badge/lisence-MIT-blue.svg)
</center>

## Description
BitStat is a site that visualises Bitcoin currency info and does currency exchange from Bitcoin (BTC) to selected currencies.

Data will be collected from Blockchain.com's API. To achieve the main features, 2 instances of virtual machines will be needed. One will collect the required data from the Blockchain API periodically using scripts (Bash and Python) and store the data in maybe a TXT/basic format first on the Google Cloud Storage.

The other virtual machine will then read the data from Google Cloud Storage then process it and make it into a more advanced format (maybe CSV?) so that data can be stored using DynamoDB (on AWS). Google App Engine will be used to host the website (not on virtual machine), data will be visualised with graphs and charts.

## Technolgy
<code>React.js</code>, <code>Chart.js</code>, <code>Bootstrap</code>, <code>Python</code>, <code>Google Bigquery</code>, <code>Google Cloud Storage</code>, <code>Google App Engine</code>

## Team
- Austin Pham @rockmanvnx6
- Yong Jia Jun @yongjiajun
- Wei wei Wen @weiweiwen