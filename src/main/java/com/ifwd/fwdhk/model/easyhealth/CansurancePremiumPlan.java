package com.ifwd.fwdhk.model.easyhealth;


public class CansurancePremiumPlan {
       private String type;
       
       private String planCode;
       
       private String monthlyPremium;
       
       private String discountedAmount;
       
       private String totalDue;
       

       public String getType() {
              return type;
       }

       public void setType(String type) {
              this.type = type;
       }

       public String getPlanCode() {
              return planCode;
       }

       public void setPlanCode(String planCode) {
              this.planCode = planCode;
       }

       public String getMonthlyPremium() {
              return monthlyPremium;
       }

       public void setMonthlyPremium(String monthlyPremium) {
              this.monthlyPremium = monthlyPremium;
       }

       public String getDiscountedAmount() {
              return discountedAmount;
       }

       public void setDiscountedAmount(String discountedAmount) {
              this.discountedAmount = discountedAmount;
       }

       public String getTotalDue() {
              return totalDue;
       }
       public void setTotalDue(String totalDue) {
              this.totalDue = totalDue;
       }

}

