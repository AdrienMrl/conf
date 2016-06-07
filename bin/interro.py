#! /usr/bin/env python3

import sys
import random
import os

data_file = sys.argv[1]

qa = dict()

def strize(qa):

  result = str()

  for question in qa:
    result += question + ':' + ','.join(qa[question])
    result += '\n'

  return result


def dumpit(qa):
  with open(data_file, 'w') as f:
    s = strize(qa)
    f.write(s)

with open(data_file) as f:

  while True:
    line =  f.readline().strip('\n')
    if line == '':
      break
    question, answer = line.split(':')
    answers = answer.split(',')
    qa[question] = answers

while True:
  chose = random.randrange(0, len(qa))
  key = list(qa.keys())[chose]
  print('{} ?'.format(key))
  try:
    answer = os.read(0, 100).decode().strip('\n')
  except KeyboardInterrupt:
    break
  if answer in qa[key]:
    print('good ! [{}]'.format(' or '.join(qa[key])))
  else:
    print('bad: {}'.format(' or '.join(qa[key])))
    if answer != '':
      print('do you want to add the word ? [y]')
      decision = os.read(0, 2).decode()
      answer = answer[0].upper() + answer[1:]
      if decision[0] != 'N':
        qa[key].append(answer)
        dumpit(qa)
