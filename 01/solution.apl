⍝ This outrageous function loads the given input filename
⍝ as a vector of numbers
loadCSV ← {⊃(⎕CSV⍠'Invert' 1) ⍵ '' 3}

In ← loadCSV '/input.txt'
⍝ An outer sum product P; each P[i;j] is In[i] + In[j]
⍝ 
⍝ Thus if P[i; j] = 2020, we know
⍝   In[i] + In[j] = 2020
⍝ 
⍝ i.e. our two numbers are at i and j in the input array
P ← In ∘.+ In

⍝ Find all of the occurrences of 2020
2020 ⍷ In ∘.+ In
⍝ Find all the indices of 2020
⍸ 2020 ⍷ In ∘.+ In

⍝ Use this to subscript our input, we'll get our 2 numbers
In[⊃⍸ 2020 ⍷ In ∘.+ In]

⍝ And their product
×/ In[⊃⍸ 2020 ⍷ In ∘.+ In ∘.+ In]

⍝ The second part asks for the three numbers that sum to
⍝ 2020, so we just get a 3-d outer product
×/ In[⊃⍸ 2020 ⍷ In ∘.+ In ∘.+ In]
