#!/bin/bash
# RDP Connection to xrdp.inf.ed.ac.uk for DICE access using freedrp.
# a copy of this file should be in /usr/local/bin to be globally accessible
# replace s12345676 with your student number with the s prefix
xfreerdp /u:s1234567 /v:xrdp.inf.ed.ac.uk +glyph-cache /relax-order-checks &
