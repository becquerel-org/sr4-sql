#!/bin/bash
cat sr4chargen.sql sr4views.sql sr4data.sql sr4test.sql | sqlite3 sr4.sqlite3;
sqlite3 sr4.sqlite3;

