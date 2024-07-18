# Verra Registry Analysis Project
![Verra Projects](https://github.com/user-attachments/assets/e2e2e957-3f50-4503-a874-b46a9bce69bb)


## Overview
This project aims to analyze and derive insights from the Verra registry data on carbon offset projects in Kenya. The analysis focuses on understanding the diversity, impact, and alignment of these projects with global sustainability objectives.

## Data Source
The data was sourced from the Verra Registry, which provides comprehensive details on carbon offset projects. The dataset includes information on project registration dates, emission reduction estimates, proponents, project types, methodologies, and crediting periods.

**Verra Registry Data Source:** [Verra Registry](https://registry.verra.org/app/search/VCS/Registered)

## Process
The analysis was conducted in three main steps:

### 1. Data Cleaning in Excel
- Addressed inconsistencies, missing values, and formatting issues.
- Changed crediting period dates and project registration dates to the date format.
- Reclassified project types into six categories: AFOLU, Renewable Energy, Waste Handling and Disposal, Cookstove Projects, Energy Distribution, and Transport.
- Further classified AFOLU activities into ARR, ALM, and REDD.

### 2. Data Analysis in SQL
- Performed structured queries to extract meaningful patterns and trends.
- Key data extracted:
  - Total number of Verra projects in Kenya
  - Total estimated annual emission reduction
  - Project with the highest estimated annual emission reduction
  - Projects in each project type category
  - Proponent with the most projects
  - Distribution of project statuses
  - Comparison of AFOLU vs. non-AFOLU projects
  - Projects currently under development
  - Most frequently used methodologies
  - Top 5 projects by proponents with the most projects
  - Distribution of estimated annual emission reductions
  - Projects with the longest and shortest crediting periods
  - Proponents with the highest average annual emission reductions

### 3. Data Visualization in Tableau
- Created visualizations to effectively present the analyzed data.
- Charts and graphs were used to illustrate trends in emission reductions, project types distribution, proponents with the most projects, and more.
- [Tableau Dashboard](https://public.tableau.com/app/profile/collins.kimathi/viz/VerraProjectsInKenya/VerraProjects)

## Insights
- **Total Number of Verra Projects:** 55 (29 AFOLU, 26 Non-AFOLU)
- **Total Estimated Annual Emission Reduction:** 42,667,633 tCO2
- **Proponent with the Most Projects:** Clean Air Action Corporation (9 projects)
- **Project Status Distribution:** Majority in development, validation, and registration phases; 21 projects fully registered.
- **Current Projects Under Development:** KUZA MITI Agroforestry Carbon Project, Entooma Sidai, Solaxy Cookstoves, One Mara Carbon Project, Electrify Africa Restore Africa, Restoring Trees and Livelihoods.
- **Most Frequently Used Methodology:** VMR0006 (Energy Efficiency and Fuel Switch Measures in Thermal Applications)
- **Crediting Periods:** AFOLU projects have longer crediting periods; Non-AFOLU projects have shorter periods.

## Recommendations
1. Expand and support AFOLU projects.
2. Leverage cookstove projects for emission reductions.
3. Enhance project development support.
4. Diversify methodologies and innovations.
5. Promote proponent collaboration and knowledge sharing.
6. Increase awareness and education.
7. Monitor and evaluate project impact.
8. Strengthen policy and regulatory frameworks.
9. Encourage private sector investment.
10. Focus on high-impact areas.


Feel free to contribute to the project by submitting issues or pull requests. For any questions, contact Collins Kimathi Mwiti at [collinskimathimwiti@gmail.com](mailto:collinskimathimwiti@gmail.com).
