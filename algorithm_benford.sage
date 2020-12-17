#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Nov 15 20:42:30 2020

@author: sylviawu, kilian
"""

import matplotlib.pyplot as plt
import numpy as np
import math


# gets first nonzero digit from a number
def extract_first_digit(num, base):
    if num < 1:
        while num < 1:
            num *= base
    elif num >= base:
        while num >= base:
            num /= base
    return floor(num)


def benford(base):
    benford_digits = []
    for digit in x:
        benford_digits.append(math.log(1+1/(digit), base))
    return benford_digits


def algorithmDist4(n, trials, base):
    sample = []
    first_digits = []
    # Generate sample, goes into sample[]
    for i in range(0, trials):
        x = RealField(100).random_element(0, 2)
        if n > 0:
            for j in range(0, n):
                x = RealField(100).random_element(0, 2*x)
        sample.append(x)

    first_digits_frequency = [0 for i in srange(base)]
    for number in sample:
        first_digits_frequency[extract_first_digit(number, base)] += 1
    for i in srange(len(first_digits_frequency)):
        first_digits_frequency[i] /= trials
    return first_digits_frequency


base = 10
trials = 100
for i in range(1, 9):
    first_digits_frequency = algorithmDist4(i, trials, base)
    plt = Graphics()
    plt += list_plot(first_digits_frequency, color='red').plot()
    plt += plot(log(1+1/(x), base), (x, 1, base))
    #plt.axes_labels(['First Digits in Base ' + str(base), 'First Digit Percent'])
    #plt.title('Distribution: ' + i + ', Trials: ' + trials)
    plt.save('Histogram' + str(i) + '.png')

print(variance(benford()))

#first_digits_frequency = algorithmDist4(1, 100000, base)
#plt = Graphics()
#plt += list_plot(first_digits_frequency).plot()
#plt += plot(log(1+1/(x), base), (x, 1, base))
#plt.save('Histogram' + str(i) + '.png')
