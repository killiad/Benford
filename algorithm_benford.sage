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
    benford_digits = [0]
    for digit in srange(1, base):
        benford_digits.append(math.log(1+1/(digit), base))
    return benford_digits


def calculate_deviation(data, benford_law):
    norm_difference = []
    for i in range(1, len(data)):
        norm_difference.append((benford_law[i] - data[i]) ^ 2)
    return sum(norm_difference) / (base-1)


def calculate_sigmas(trials, base):
    benford_values = benford(base)
    sigmas = []
    for value in benford_values:
        sigmas.append(sqrt(trials * value * (1 - value)))
    return sigmas


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
    # for i in srange(len(first_digits_frequency)):
    #    first_digits_frequency[i] /= trials
    return first_digits_frequency


def benford_function(x, base):
    return log(1+1/(x), base)


def sigma_function(x, trials, base):
    return sqrt(trials * benford_function(x, base) * (1 - benford_function(x, base)))


base = 10
trials = 100
sigmas = calculate_sigmas(trials, base)
benford_law = benford(base)
for i in range(1, 7):
    first_digits_frequency = algorithmDist4(i, trials, base)
    plt = Graphics()
    plt += list_plot(first_digits_frequency, color='red').plot()
    #plt += plot(log(1+1/(x), base), (x, 1, base))
    plt += plot(trials * benford_function(x, base) - 3 *
                sigma_function(x, trials, base), (x, 1, base), color='purple')
    plt += plot(trials * benford_function(x, base) + 3 *
                sigma_function(x, trials, base), (x, 1, base), color='purple')
    plt += plot(trials * benford_function(x, base) - 6 *
                sigma_function(x, trials, base), (x, 1, base), color='green')
    plt += plot(trials * benford_function(x, base) + 6 *
                sigma_function(x, trials, base), (x, 1, base), color='green')
    plt.save('Histogram' + str(i) + '.png')
    print("Iteration: " + str(i) + "\tMean Squared Error: " +
          str(calculate_deviation(first_digits_frequency, benford_law)))

#iteration = 1
#first_digits_frequency = algorithmDist4(iteration, trials, base)
#plt = Graphics()
#plt += list_plot(first_digits_frequency).plot()
##plt += plot(log(1+1/(x), base), (x, 1, base))
#plt += plot(trials * benford_function(x, base) - 3 * sigma_function(x, trials, base), (x, 1, base), color='purple')
#plt += plot(trials * benford_function(x, base) + 3 * sigma_function(x, trials, base), (x, 1, base), color='purple')
#plt += plot(trials * benford_function(x, base) - 6 * sigma_function(x, trials, base), (x, 1, base), color='green')
#plt += plot(trials * benford_function(x, base) + 6 * sigma_function(x, trials, base), (x, 1, base), color='green')
#plt.save('Histogram' + str(iteration) + '.png')
# print("Iteration: " + str(1) + "\tMean Squared Error: " +
#      str(calculate_deviation(first_digits_frequency, benford_law)))
