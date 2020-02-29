#!/bin/bash
# Authenticate to INF.ED.AC.UK with kerberos and setup access to AFS
# a copy of this file should be in /usr/local/bin to be globally accessible
# replace s12345676 with your student number with the s prefix
kinit s1234567
aklog
