# Diagrams and Procedures for Partition of Variation

    ## Loading required package: permute

Diagrams describing the partitions of variation of a response data table
by two (Figure 1), three (Figure 2) and four tables (Figure 3) of
explanatory variables. The fraction names \[a\] to \[p\] in the output
of the `varpart` function follow the notation in these Venn diagrams,
and the diagrams were produced using the `showvarparts` function.

### Figure 1: Partitioning with 2 Tables

![3 regression/ canonical analyses and 3 subtraction equations are
needed to estimate the 4 (=2^2) fractions. \[a\] and \[b\] can be tested
for significance (3 canonical analyses per permutation). Fraction \[c\]
cannot be tested singly.](partitioning_files/figure-html/fig1-1.png)

3 regression/ canonical analyses and 3 subtraction equations are needed
to estimate the 4 (=2^2) fractions. \[a\] and \[b\] can be tested for
significance (3 canonical analyses per permutation). Fraction \[c\]
cannot be tested singly.

### Figure 2: Partitioning with 3 Tables

    #> Warning in pt - sw: longer object length is not a multiple of shorter object
    #> length
    #> Warning in pt + sw: longer object length is not a multiple of shorter object
    #> length
    #> labels do not fit the space, switching to X1...

![7 regression/ canonical analyses and 10 subtraction equations are
needed to estimate the 8 (=2^3) fractions. \[a\] to \[c\] and subsets
containing \[a\] to \[c\] can be tested for significance (4 canonical
analyses per permutation to test \[a\] to \[c\]). Fractions \[d\] to
\[g\] cannot be tested
singly.](partitioning_files/figure-html/fig2-1.png)

7 regression/ canonical analyses and 10 subtraction equations are needed
to estimate the 8 (=2^3) fractions. \[a\] to \[c\] and subsets
containing \[a\] to \[c\] can be tested for significance (4 canonical
analyses per permutation to test \[a\] to \[c\]). Fractions \[d\] to
\[g\] cannot be tested singly.

### Figure 3: Partitioning with 4 Tables

    #> labels do not fit the space, switching to X1...

![15 regression/ canonical analyses and 27 subtraction equations are
needed to estimate the 16 (=2^4) fractions. \[a\] to \[d\] and subsets
containing \[a\] to \[d\] can be tested for significance (5 canonical
analyses per permutation to test \[a\] to \[d\]). Fractions \[e\] to
\[o\] cannot be tested
singly.](partitioning_files/figure-html/fig3-1.png)

15 regression/ canonical analyses and 27 subtraction equations are
needed to estimate the 16 (=2^4) fractions. \[a\] to \[d\] and subsets
containing \[a\] to \[d\] can be tested for significance (5 canonical
analyses per permutation to test \[a\] to \[d\]). Fractions \[e\] to
\[o\] cannot be tested singly.

------------------------------------------------------------------------

## Procedures for Variation Partitioning

Below are the detailed algebraic procedures, derived fractions, and
degrees of freedom for partitioning variation with two, three, and four
explanatory tables.

### 1. Two Explanatory Data Tables

- **Table 1** with $`m_1`$ explanatory variables.
- **Table 2** with $`m_2`$ explanatory variables.
- **Number of fractions:** 4, called $`[a]`$ to $`[d]`$.
- $`\checkmark`$ indicates the 3 regression or canonical analyses that
  have to be computed.
- $`\#`$ indicates partial canonical analyses (only computed if tests of
  significance or biplots are needed).

| Type | Compute | Fitted | Residuals | Derived fractions | Degrees of freedom |
|:---|:---|:---|:---|:---|:---|
| $`\checkmark`$ | $`Y \cdot 1`$ | $`[a+b]`$ | $`[c+d]`$ | \(1\) | $`\text{df}(a+b) = m_1`$ |
| $`\checkmark`$ | $`Y \cdot 2`$ | $`[b+c]`$ | $`[a+d]`$ | \(2\) | $`\text{df}(b+c) = m_2`$ |
| $`\checkmark`$ | $`Y \cdot 1,2`$ | $`[a+b+c]`$ | $`[d]`$ | \(3\) | $`\text{df}(a+b+c) = m_3 \le m_1+m_2`$ |
| $`\#`$ | $`Y \cdot 1 \vert 2`$ | $`[a]`$ | $`[d]`$ |  | $`\text{df}(a) = m_3-m_2`$ |
| $`\#`$ | $`Y \cdot 2 \vert 1`$ | $`[c]`$ | $`[d]`$ |  | $`\text{df}(c) = m_3-m_1`$ |

#### Partial Analyses

- Controlling for 1 table $`X`$:
  - 4.  $`[a] = [a+b+c] - [b+c]`$   $`\text{df}(a) = m_3-m_2^*`$
  - 5.  $`[c] = [a+b+c] - [a+b]`$   $`\text{df}(c) = m_3-m_1^*`$
  - 6.  $`[b] = [a+b] + [b+c] - [a+b+c]`$  
        $`\text{df}(b) = m_1+m_2-(m_1+m_2) = 0`$
  - 7.  $`[d] = \text{residuals} = 1 - [a+b+c]`$  
        $`\text{df}_2(d) = n-1-m_3`$ (for denominator of $`F`$)

*\* Calculation of d.f. for difference between nested models: see Sokal
& Rohlf (1981, 1995) equation 16.14.*

#### Tests of Significance

- $`F(a+b) = \frac{[a+b]/m_1}{[c+d]/(n-1-m_1)}`$
- $`F(b+c) = \frac{[b+c]/m_2}{[a+d]/(n-1-m_2)}`$
- $`F(a+b+c) = \frac{[a+b+c]/m_3}{[d]/(n-1-m_3)}`$
- $`F(a) = \frac{[a]/(m_3-m_2)}{[d]/(n-1-m_3)}`$
- $`F(c) = \frac{[c]/(m_3-m_1)}{[d]/(n-1-m_3)}`$

> \[!NOTE\] The only testable fractions are those that can be obtained
> directly by regression or canonical analysis. The non-testable
> fraction is $`[b]`$; that fraction cannot be obtained directly by
> regression or canonical analysis.

------------------------------------------------------------------------

### 2. Three Explanatory Data Tables

- **Table 1** with $`m_1`$ variables, **Table 2** with $`m_2`$
  variables, **Table 3** with $`m_3`$ variables.
- **Number of fractions:** 8, called $`[a]`$ to $`[h]`$.
- $`\checkmark`$ indicates the 7 regression or canonical analyses that
  have to be computed.
- $`\#`$ indicates partial canonical analyses (only computed if tests of
  significance or biplots are needed).

| Type | Compute | Fitted | Residuals | Derived fractions | Degrees of freedom |
|:---|:---|:---|:---|:---|:---|
| $`\checkmark`$ | $`Y \cdot 1`$ | $`[a+d+f+g]`$ | $`[b+c+e+h]`$ | \(1\) | $`\text{df}(a+d+f+g) = m_1`$ |
| $`\checkmark`$ | $`Y \cdot 2`$ | $`[b+d+e+g]`$ | $`[a+c+f+h]`$ | \(2\) | $`\text{df}(b+d+e+g) = m_2`$ |
| $`\checkmark`$ | $`Y \cdot 3`$ | $`[c+e+f+g]`$ | $`[a+b+d+h]`$ | \(3\) | $`\text{df}(c+e+f+g) = m_3`$ |
| $`\checkmark`$ | $`Y \cdot 1,2`$ | $`[a+b+d+e+f+g]`$ | $`[c+h]`$ | \(4\) | $`\text{df}(a+b+d+e+f+g) = m_4 \le m_1+m_2`$ |
| $`\checkmark`$ | $`Y \cdot 1,3`$ | $`[a+c+d+e+f+g]`$ | $`[b+h]`$ | \(5\) | $`\text{df}(a+c+d+e+f+g) = m_5 \le m_1+m_3`$ |
| $`\checkmark`$ | $`Y \cdot 2,3`$ | $`[b+c+d+e+f+g]`$ | $`[a+h]`$ | \(6\) | $`\text{df}(b+c+d+e+f+g) = m_6 \le m_2+m_3`$ |
| $`\checkmark`$ | $`Y \cdot 1,2,3`$ | $`[a+b+c+d+e+f+g]`$ | $`[h]`$ | \(7\) | $`\text{df}(a+b+c+d+e+f+g) = m_7 \le m_1+m_2+m_3`$ |
| $`\#`$ | $`Y \cdot 1 \vert 2`$ | $`[a+f]`$ | $`[c+h]`$ |  | $`\text{df}(a+f) = m_4-m_2`$ |
| $`\#`$ | $`Y \cdot 1 \vert 3`$ | $`[a+d]`$ | $`[b+h]`$ |  | $`\text{df}(a+d) = m_5-m_3`$ |
| $`\#`$ | $`Y \cdot 2 \vert 1`$ | $`[b+e]`$ | $`[c+h]`$ |  | $`\text{df}(b+e) = m_4-m_1`$ |
| $`\#`$ | $`Y \cdot 2 \vert 3`$ | $`[b+d]`$ | $`[a+h]`$ |  | $`\text{df}(b+d) = m_6-m_3`$ |
| $`\#`$ | $`Y \cdot 3 \vert 1`$ | $`[c+e]`$ | $`[b+h]`$ |  | $`\text{df}(c+e) = m_5-m_1`$ |
| $`\#`$ | $`Y \cdot 3 \vert 2`$ | $`[c+f]`$ | $`[a+h]`$ |  | $`\text{df}(c+f) = m_6-m_2`$ |
| $`\#`$ | $`Y \cdot 1 \vert 2,3`$ | $`[a]`$ | $`[h]`$ |  | $`\text{df}(a) = m_7-m_6`$ |
| $`\#`$ | $`Y \cdot 2 \vert 1,3`$ | $`[b]`$ | $`[h]`$ |  | $`\text{df}(b) = m_7-m_5`$ |
| $`\#`$ | $`Y \cdot 3 \vert 1,2`$ | $`[c]`$ | $`[h]`$ |  | $`\text{df}(c) = m_7-m_4`$ |

#### Partial Analyses

- Controlling for two tables $`X`$:
  - 8.  $`[a] = [a+b+c+d+e+f+g] - [b+c+d+e+f+g]`$  
        $`\text{df}(a) = m_7-m_6`$
  - 9.  $`[b] = [a+b+c+d+e+f+g] - [a+c+d+e+f+g]`$  
        $`\text{df}(b) = m_7-m_5`$
  - 10. $`[c] = [a+b+c+d+e+f+g] - [a+b+d+e+f+g]`$  
        $`\text{df}(c) = m_7-m_4`$
- Controlling for one table $`X`$:
  - 11. $`[a+d] = [a+c+d+e+f+g] - [c+e+f+g]`$  
        $`\text{df}(a+d) = m_5-m_3`$
  - 12. $`[a+f] = [a+b+d+e+f+g] - [b+d+e+g]`$  
        $`\text{df}(a+f) = m_4-m_2`$
  - 13. $`[b+d] = [b+c+d+e+f+g] - [c+e+f+g]`$  
        $`\text{df}(b+d) = m_6-m_3`$
  - 14. $`[b+e] = [a+b+d+e+f+g] - [a+d+f+g]`$  
        $`\text{df}(b+e) = m_4-m_1`$
  - 15. $`[c+e] = [a+c+d+e+f+g] - [a+d+f+g]`$  
        $`\text{df}(c+e) = m_5-m_1`$
  - 16. $`[c+f] = [b+c+d+e+f+g] - [b+d+e+g]`$  
        $`\text{df}(c+f) = m_6-m_2`$

#### Fractions Estimated by Subtraction (cannot be tested)

- 17. $`[d] = [a+d] - [a]`$   $`\text{df}(d) = m_1-m_1 = 0`$

- 18. $`[e] = [b+e] - [b]`$   $`\text{df}(e) = m_2-m_2 = 0`$

- 19. $`[f] = [c+f] - [c]`$   $`\text{df}(f) = m_3-m_3 = 0`$

- 20. $`[g] = [a+b+c+d+e+f+g] - [a+d] - [b+e] - [c+f]`$  
      $`\text{df}(g) = (m_1+m_2+m_3)-m_1-m_2-m_3 = 0`$

  - or $`[g] = [a+d+f+g] - [a] - [d] - [f]`$  
    $`\text{df}(g) = m_1-m_1-0-0 = 0`$

- 21. $`[h] = \text{residuals} = 1 - [a+b+c+d+e+f+g]`$  
      $`\text{df}_2(h) = n-1-m_7`$ (for denominator of $`F`$)

#### Tests of Significance

- $`F(a+d+f+g) = \frac{[a+d+f+g]/m_1}{[b+c+e+h]/(n-1-m_1)}`$
- $`F(b+d+e+g) = \frac{[b+d+e+g]/m_2}{[a+c+f+h]/(n-1-m_2)}`$
- $`F(c+e+f+g) = \frac{[c+e+f+g]/m_3}{[a+b+d+h]/(n-1-m_3)}`$
- $`F(a+b+d+e+f+g) = \frac{[a+b+d+e+f+g]/m_4}{[c+h]/(n-1-m_4)}`$
- $`F(a+c+d+e+f+g) = \frac{[a+c+d+e+f+g]/m_5}{[b+h]/(n-1-m_5)}`$
- $`F(b+c+d+e+f+g) = \frac{[b+c+d+e+f+g]/m_6}{[a+h]/(n-1-m_6)}`$
- $`F(a+b+c+d+e+f+g) = \frac{[a+b+c+d+e+f+g]/m_7}{[h]/(n-1-m_7)}`$
- $`F(a) = \frac{[a]/(m_7-m_6)}{[h]/(n-1-m_7)}`$
- $`F(b) = \frac{[b]/(m_7-m_5)}{[h]/(n-1-m_7)}`$
- $`F(c) = \frac{[c]/(m_7-m_4)}{[h]/(n-1-m_7)}`$
- $`F(a+d) = \frac{[a+d]/(m_5-m_3)}{[b+h]/(n-1-m_5)}`$
- $`F(a+f) = \frac{[a+f]/(m_4-m_2)}{[c+h]/(n-1-m_4)}`$
- $`F(b+d) = \frac{[b+d]/(m_6-m_3)}{[a+h]/(n-1-m_6)}`$
- $`F(b+e) = \frac{[b+e]/(m_4-m_1)}{[c+h]/(n-1-m_4)}`$
- $`F(c+e) = \frac{[c+e]/(m_5-m_1)}{[b+h]/(n-1-m_5)}`$
- $`F(c+f) = \frac{[c+f]/(m_6-m_2)}{[a+h]/(n-1-m_6)}`$

------------------------------------------------------------------------

### 3. Four Explanatory Data Tables

- **Table 1** with $`m_1`$ variables, **Table 2** with $`m_2`$
  variables, **Table 3** with $`m_3`$ variables, **Table 4** with
  $`m_4`$ variables.
- **Number of fractions:** 16, called $`[a]`$ to $`[p]`$.
- $`\checkmark`$ indicates the 15 regression or canonical analyses that
  have to be computed.

| Type | Compute | Fitted | Residuals | Derived fractions | Degrees of freedom |
|:---|:---|:---|:---|:---|:---|
| $`\checkmark`$ | $`Y \cdot 1`$ | $`[a+e+g+h+k+l+n+o]`$ | $`[b+c+d+f+i+j+m+p]`$ | \(1\) | $`\text{df} = m_1`$ |
| $`\checkmark`$ | $`Y \cdot 2`$ | $`[b+e+f+i+k+l+m+o]`$ | $`[a+c+d+g+h+j+n+p]`$ | \(2\) | $`\text{df} = m_2`$ |
| $`\checkmark`$ | $`Y \cdot 3`$ | $`[c+f+g+j+l+m+n+o]`$ | $`[a+b+d+e+h+i+k+p]`$ | \(3\) | $`\text{df} = m_3`$ |
| $`\checkmark`$ | $`Y \cdot 4`$ | $`[d+h+i+j+k+m+n+o]`$ | $`[a+b+c+e+f+g+l+p]`$ | \(4\) | $`\text{df} = m_4`$ |
| $`\checkmark`$ | $`Y \cdot 1,2`$ | $`[a+b+e+f+g+h+i+k+l+m+n+o]`$ | $`[c+d+j+p]`$ | \(5\) | $`\text{df} = m_5 \le m_1+m_2`$ |
| $`\checkmark`$ | $`Y \cdot 1,3`$ | $`[a+c+e+f+g+h+j+k+l+m+n+o]`$ | $`[b+d+i+p]`$ | \(6\) | $`\text{df} = m_6 \le m_1+m_3`$ |
| $`\checkmark`$ | $`Y \cdot 1,4`$ | $`[a+d+e+g+h+i+j+k+l+m+n+o]`$ | $`[b+c+f+p]`$ | \(7\) | $`\text{df} = m_7 \le m_1+m_4`$ |
| $`\checkmark`$ | $`Y \cdot 2,3`$ | $`[b+c+e+f+g+i+j+k+l+m+n+o]`$ | $`[a+d+h+p]`$ | \(8\) | $`\text{df} = m_8 \le m_2+m_3`$ |
| $`\checkmark`$ | $`Y \cdot 2,4`$ | $`[b+d+e+f+h+i+j+k+l+m+n+o]`$ | $`[a+c+g+p]`$ | \(9\) | $`\text{df} = m_9 \le m_2+m_4`$ |
| $`\checkmark`$ | $`Y \cdot 3,4`$ | $`[c+d+f+g+h+i+j+k+l+m+n+o]`$ | $`[a+b+e+p]`$ | \(10\) | $`\text{df} = m_{10} \le m_3+m_4`$ |
| $`\checkmark`$ | $`Y \cdot 1,2,3`$ | $`[a+b+c+e+f+g+h+i+j+k+l+m+n+o]`$ | $`[d+p]`$ | \(11\) | $`\text{df} = m_{11} \le m_1+m_2+m_3`$ |
| $`\checkmark`$ | $`Y \cdot 1,2,4`$ | $`[a+b+d+e+f+g+h+i+j+k+l+m+n+o]`$ | $`[c+p]`$ | \(12\) | $`\text{df} = m_{12} \le m_1+m_2+m_4`$ |
| $`\checkmark`$ | $`Y \cdot 1,3,4`$ | $`[a+c+d+e+f+g+h+i+j+k+l+m+n+o]`$ | $`[b+p]`$ | \(13\) | $`\text{df} = m_{13} \le m_1+m_3+m_4`$ |
| $`\checkmark`$ | $`Y \cdot 2,3,4`$ | $`[b+c+d+e+f+g+h+i+j+k+l+m+n+o]`$ | $`[a+p]`$ | \(14\) | $`\text{df} = m_{14} \le m_2+m_3+m_4`$ |
| $`\checkmark`$ | $`Y \cdot 1,2,3,4`$ | $`[a+b+c+d+e+f+g+h+i+j+k+l+m+n+o]`$ | $`[p]`$ | \(15\) | $`\text{df} = m_{15} \le m_1+m_2+m_3+m_4`$ |

#### Partial Analyses

- **Controlling for one table $`X`$:**
  - 16. $`[a+g+h+n] = [a+b+e+f+g+h+i+k+l+m+n+o] - [b+e+f+i+k+l+m+o]`$  
        $`\text{df} = m_5 - m_2`$
  - 17. $`[a+e+h+k] = [a+c+e+f+g+h+j+k+l+m+n+o] - [c+f+g+j+l+m+n+o]`$  
        $`\text{df} = m_6 - m_3`$
  - 18. $`[a+e+g+l] = [a+d+e+g+h+i+j+k+l+m+n+o] - [d+h+i+j+k+m+n+o]`$  
        $`\text{df} = m_7 - m_4`$
  - 19. $`[b+f+i+m] = [a+b+e+f+g+h+i+k+l+m+n+o] - [a+e+g+h+k+l+n+o]`$  
        $`\text{df} = m_5 - m_1`$
  - 20. $`[b+e+i+k] = [b+c+e+f+g+i+j+k+l+m+n+o] - [c+f+g+j+l+m+n+o]`$  
        $`\text{df} = m_8 - m_3`$
  - 21. $`[b+e+f+l] = [b+d+e+f+h+i+j+k+l+m+n+o] - [d+h+i+j+k+m+n+o]`$  
        $`\text{df} = m_9 - m_4`$
  - 22. $`[c+f+j+m] = [a+c+e+f+g+h+j+k+l+m+n+o] - [a+e+g+h+k+l+n+o]`$  
        $`\text{df} = m_6 - m_1`$
  - 23. $`[c+g+j+n] = [b+c+e+f+g+i+j+k+l+m+n+o] - [b+e+f+i+k+l+m+o]`$  
        $`\text{df} = m_8 - m_2`$
  - 24. $`[c+f+g+l] = [c+d+f+g+h+i+j+k+l+m+n+o] - [d+h+i+j+k+m+n+o]`$  
        $`\text{df} = m_{10} - m_4`$
  - 25. $`[d+i+j+m] = [a+d+e+g+h+i+j+k+l+m+n+o] - [a+e+g+h+k+l+n+o]`$  
        $`\text{df} = m_7 - m_1`$
  - 26. $`[d+h+j+n] = [b+d+e+f+h+i+j+k+l+m+n+o] - [b+e+f+i+k+l+m+o]`$  
        $`\text{df} = m_9 - m_2`$
  - 27. $`[d+h+i+k] = [c+d+f+g+h+i+j+k+l+m+n+o] - [c+f+g+j+l+m+n+o]`$  
        $`\text{df} = m_{10} - m_3`$
- **Controlling for two tables $`X`$:**
  - 28. $`[a+e] = [a+c+d+e+f+g+h+i+j+k+l+m+n+o] - [c+d+f+g+h+i+j+k+l+m+n+o]`$
          $`\text{df} = m_{13} - m_{10}`$
  - 29. $`[a+g] = [a+b+d+e+f+g+h+i+j+k+l+m+n+o] - [b+d+e+f+h+i+j+k+l+m+n+o]`$
          $`\text{df} = m_{12} - m_9`$
  - 30. $`[a+h] = [a+b+c+e+f+g+h+i+j+k+l+m+n+o] - [b+c+e+f+g+i+j+k+l+m+n+o]`$
          $`\text{df} = m_{11} - m_8`$
  - 31. $`[b+e] = [b+c+d+e+f+g+h+i+j+k+l+m+n+o] - [c+d+f+g+h+i+j+k+l+m+n+o]`$
          $`\text{df} = m_{14} - m_{10}`$
  - 32. $`[b+f] = [a+b+d+e+f+g+h+i+j+k+l+m+n+o] - [a+d+e+g+h+i+j+k+l+m+n+o]`$
          $`\text{df} = m_{12} - m_7`$
  - 33. $`[b+i] = [a+b+c+e+f+g+h+i+j+k+l+m+n+o] - [a+c+e+f+g+h+j+k+l+m+n+o]`$
          $`\text{df} = m_{11} - m_6`$
  - 34. $`[c+f] = [a+c+d+e+f+g+h+i+j+k+l+m+n+o] - [a+d+e+g+h+i+j+k+l+m+n+o]`$
          $`\text{df} = m_{13} - m_7`$
  - 35. $`[c+g] = [b+c+d+e+f+g+h+i+j+k+l+m+n+o] - [b+d+e+f+h+i+j+k+l+m+n+o]`$
          $`\text{df} = m_{14} - m_9`$
  - 36. $`[c+j] = [a+b+c+e+f+g+h+i+j+k+l+m+n+o] - [a+b+e+f+g+h+i+k+l+m+n+o]`$
          $`\text{df} = m_{11} - m_5`$
  - 37. $`[d+h] = [b+c+d+e+f+g+h+i+j+k+l+m+n+o] - [b+c+e+f+g+i+j+k+l+m+n+o]`$
          $`\text{df} = m_{14} - m_8`$
  - 38. $`[d+i] = [a+c+d+e+f+g+h+i+j+k+l+m+n+o] - [a+c+e+f+g+h+j+k+l+m+n+o]`$
          $`\text{df} = m_{13} - m_6`$
  - 39. $`[d+j] = [a+b+d+e+f+g+h+i+j+k+l+m+n+o] - [a+b+e+f+g+h+i+k+l+m+n+o]`$
          $`\text{df} = m_{12} - m_5`$
- **Controlling for three tables $`X`$:**
  - 40. $`[a] = [a+b+c+d+e+f+g+h+i+j+k+l+m+n+o] - [b+c+d+e+f+g+h+i+j+k+l+m+n+o]`$
          $`\text{df} = m_{15} - m_{14}`$
  - 41. $`[b] = [a+b+c+d+e+f+g+h+i+j+k+l+m+n+o] - [a+c+d+e+f+g+h+i+j+k+l+m+n+o]`$
          $`\text{df} = m_{15} - m_{13}`$
  - 42. $`[c] = [a+b+c+d+e+f+g+h+i+j+k+l+m+n+o] - [a+b+d+e+f+g+h+i+j+k+l+m+n+o]`$
          $`\text{df} = m_{15} - m_{12}`$
  - 43. $`[d] = [a+b+c+d+e+f+g+h+i+j+k+l+m+n+o] - [a+b+c+e+f+g+h+i+j+k+l+m+n+o]`$
          $`\text{df} = m_{15} - m_{11}`$

#### Fractions Estimated by Subtraction (cannot be tested)

- 44. $`[e] = [a+e] - [a]`$   $`\text{df} = m_1-m_1 = 0`$
- 45. $`[f] = [b+f] - [b]`$   $`\text{df} = m_2-m_2 = 0`$
- 46. $`[g] = [a+g] - [a]`$   $`\text{df} = m_1-m_1 = 0`$
- 47. $`[h] = [a+h] - [a]`$   $`\text{df} = m_1-m_1 = 0`$
- 48. $`[i] = [b+i] - [b]`$   $`\text{df} = m_2-m_2 = 0`$
- 49. $`[j] = [c+j] - [c]`$   $`\text{df} = m_3-m_3 = 0`$
- 50. $`[k] = [a+e+h+k] - [a+e] - [h]`$   $`\text{df} = m_1-m_1-0 = 0`$
- 51. $`[l] = [a+e+g+l] - [a+e] - [g]`$   $`\text{df} = m_1-m_1-0 = 0`$
- 52. $`[m] = [b+f+i+m] - [b+f] - [i]`$   $`\text{df} = m_2-m_2-0 = 0`$
- 53. $`[n] = [a+g+h+n] - [a+g] - [h]`$   $`\text{df} = m_1-m_1-0 = 0`$
- 54. $`[o] = [a+e+g+h+k+l+n+o] - [a+e+h+k] - [g] - [l] - [n]`$  
      $`\text{df} = m_1-m_1-0-0-0 = 0`$
- 55. $`[p] = \text{residuals} = 1 - [a+b+c+d+e+f+g+h+i+j+k+l+m+n+o]`$  
      $`\text{df}_2(p) = n-1-m_{15}`$

#### Tests of Significance

Tests of significance for the fractions and combinations of fractions
are constructed in the same way as for two and three tables: \*
$`F(a+e+g+h+k+l+n+o) = \frac{[a+e+g+h+k+l+n+o]/m_1}{[b+c+d+f+i+j+m+p]/(n-1-m_1)}`$
\*
$`F(b+e+f+i+k+l+m+o) = \frac{[b+e+f+i+k+l+m+o]/m_2}{[a+c+d+g+h+j+n+p]/(n-1-m_2)}`$
\*
$`F(c+f+g+j+l+m+n+o) = \frac{[c+f+g+j+l+m+n+o]/m_3}{[a+b+d+e+h+i+k+p]/(n-1-m_3)}`$
\*
$`F(d+h+i+j+k+m+n+o) = \frac{[d+h+i+j+k+m+n+o]/m_4}{[a+b+c+e+f+g+l+p]/(n-1-m_4)}`$
\*
$`F(a+b+e+f+g+h+i+k+l+m+n+o) = \frac{[a+b+e+f+g+h+i+k+l+m+n+o]/m_5}{[c+d+j+p]/(n-1-m_5)}`$
\*
$`F(a+c+e+f+g+h+j+k+l+m+n+o) = \frac{[a+c+e+f+g+h+j+k+l+m+n+o]/m_6}{[b+d+i+p]/(n-1-m_6)}`$
\*
$`F(a+d+e+g+h+i+j+k+l+m+n+o) = \frac{[a+d+e+g+h+i+j+k+l+m+n+o]/m_7}{[b+c+f+p]/(n-1-m_7)}`$
\*
$`F(b+c+e+f+g+i+j+k+l+m+n+o) = \frac{[b+c+e+f+g+i+j+k+l+m+n+o]/m_8}{[a+d+h+p]/(n-1-m_8)}`$
\*
$`F(b+d+e+f+h+i+j+k+l+m+n+o) = \frac{[b+d+e+f+h+i+j+k+l+m+n+o]/m_9}{[a+c+g+p]/(n-1-m_9)}`$
\*
$`F(c+d+f+g+h+i+j+k+l+m+n+o) = \frac{[c+d+f+g+h+i+j+k+l+m+n+o]/m_{10}}{[a+b+e+p]/(n-1-m_{10})}`$
\*
$`F(a+b+c+e+f+g+h+i+j+k+l+m+n+o) = \frac{[a+b+c+e+f+g+h+i+j+k+l+m+n+o]/m_{11}}{[d+p]/(n-1-m_{11})}`$
\*
$`F(a+b+d+e+f+g+h+i+j+k+l+m+n+o) = \frac{[a+b+d+e+f+g+h+i+j+k+l+m+n+o]/m_{12}}{[c+p]/(n-1-m_{12})}`$
\*
$`F(a+c+d+e+f+g+h+i+j+k+l+m+n+o) = \frac{[a+c+d+e+f+g+h+i+j+k+l+m+n+o]/m_{13}}{[b+p]/(n-1-m_{13})}`$
\*
$`F(b+c+d+e+f+g+h+i+j+k+l+m+n+o) = \frac{[b+c+d+e+f+g+h+i+j+k+l+m+n+o]/m_{14}}{[a+p]/(n-1-m_{14})}`$
\*
$`F(a+b+c+d+e+f+g+h+i+j+k+l+m+n+o) = \frac{[a+b+c+d+e+f+g+h+i+j+k+l+m+n+o]/m_{15}}{[p]/(n-1-m_{15})}`$

- **For the individual fractions controlling for all other tables:**
  - $`F(a) = \frac{[a]/(m_{15}-m_{14})}{[p]/(n-1-m_{15})}`$
  - $`F(b) = \frac{[b]/(m_{15}-m_{13})}{[p]/(n-1-m_{15})}`$
  - $`F(c) = \frac{[c]/(m_{15}-m_{12})}{[p]/(n-1-m_{15})}`$
  - $`F(d) = \frac{[d]/(m_{15}-m_{11})}{[p]/(n-1-m_{15})}`$
- **For individual fractions controlling for one table $`X`$:**
  - $`F(a+g+h+n) = \frac{[a+g+h+n]/(m_5-m_2)}{[c+d+j+p]/(n-1-m_5)}`$
  - (And similarly for other fractions controlling for one table $`X`$)
- **For individual fractions controlling for two tables $`X`$:**
  - $`F(a+e) = \frac{[a+e]/(m_{13}-m_{10})}{[b+p]/(n-1-m_{13})}`$
  - (And similarly for other fractions controlling for two tables $`X`$)
- **Fractions controlling for three tables $`X`$:**
  - $`F(a) = \frac{[a]/(m_{15}-m_{14})}{[p]/(n-1-m_{15})}`$
  - $`F(b) = \frac{[b]/(m_{15}-m_{13})}{[p]/(n-1-m_{15})}`$
  - $`F(c) = \frac{[c]/(m_{15}-m_{12})}{[p]/(n-1-m_{15})}`$
  - $`F(d) = \frac{[d]/(m_{15}-m_{11})}{[p]/(n-1-m_{15})}`$

> \[!IMPORTANT\] Other fractions combining elementary fractions $`[a]`$
> to $`[o]`$ can be calculated, but cannot be tested because they cannot
> be obtained by regression or canonical analysis.
