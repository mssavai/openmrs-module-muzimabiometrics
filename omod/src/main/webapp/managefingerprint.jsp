
<!DOCTYPE html>
<%@ include file="/WEB-INF/template/include.jsp"%>
<%@ include file="/WEB-INF/template/header.jsp"%>

<openmrs:htmlInclude file="/moduleResources/muzimabiometrics/styles/animate/animate.css"/>
<openmrs:htmlInclude file="/moduleResources/muzimabiometrics/styles/custom/custom.css"/>
<openmrs:htmlInclude file="/moduleResources/muzimabiometrics/styles/font-awesome/css/font-awesome.min.css"/>
<openmrs:htmlInclude file="/moduleResources/muzimabiometrics/js/jquery/jquery.js"/>
<openmrs:htmlInclude file="/moduleResources/muzimabiometrics/js/jquery/jquery-1.10.1.min.js"/>
<openmrs:htmlInclude file="/moduleResources/muzimabiometrics/js/jquery/jquery-ui-1.10.4.min.js"/>
<openmrs:htmlInclude file="/moduleResources/muzimabiometrics/js/jquery/jquery.validate.min.js"/>
<openmrs:htmlInclude file="/moduleResources/muzimabiometrics/js/underscore/underscore-min.js"/>
<openmrs:htmlInclude file="/moduleResources/muzimabiometrics/bootstrap/css/bootstrap.min.css"/>
<openmrs:htmlInclude file="/moduleResources/muzimabiometrics/bootstrap/js/bootstrap.min.js"/>
<style>
    .loader {
        border: 5px solid #f3f3f3;
        -webkit-animation: spin 1s linear infinite;
        animation: spin 1s linear infinite;
        border-top: 5px solid #555;
        border-radius: 50%;
        width: 40px;
        height: 40px;
    }

    @-webkit-keyframes spin {
        0% { -webkit-transform: rotate(0deg); }
        100% { -webkit-transform: rotate(360deg); }
    }

    @keyframes spin {
        0% { transform: rotate(0deg); }
        100% { transform: rotate(360deg); }
    }
</style>
<!--start of trial -->
<br/><br/><br/>
<nav class="navbar navbar-default" style="background-color:#009D8E !important;">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#codebrainery-toggle-nav" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand">mUzima Fingerprint Module</a>
        </div>

        <div class="collapse navbar-collapse" id="codebrainery-toggle-nav">
          <ul class="nav navbar-nav navbar-right">
            <li><button id="activatehomecontainer" type="button" class="btn btn-success btn-lg" style="background-color:#4ebaaa !important;" title="This is the mUzima Fingerprint module home screen.">Home Screen</button>&nbsp;&nbsp;&nbsp;&nbsp;</li>
            <li><button id="activatemaincontainersignin" type="button" class="btn btn-success btn-lg" style="background-color:#4ebaaa !important;"  title="This screen allows users who have appended their fingerprints to their details to login simply by scanning the fingerprint">Identification</button>&nbsp;&nbsp;&nbsp;&nbsp;</li>
            <li><button id="activatemaincontainersignup" type="button" class="btn btn-success btn-lg" style="background-color:#4ebaaa !important;"  title="This screen allows you to signup a new user with fingerprint capability or append an old patient without fingerprint capability with a fingerprint ability.">Registration</button>&nbsp;&nbsp;&nbsp;&nbsp;</li>
            <li><button id="activedefaultsettings" type="button" class="btn btn-success btn-lg" style="background-color:#4ebaaa !important;"  title="this page allows the implementor to set the default finger to be scanned in the particular setting that will show on the sign in screen">Settings</button></li>
          </ul>
        </div>

      </div> <!-- close container div -->
    </nav> <!-- close navbar nav -->
<br/>
<div id="homecontainer" class="container">
  <h3>Welcome to mUzima Fingerprint Biometrics Module</h3>
  <p>This module allows you to register a new patient with a fingerprint scan option or to append an existing user with the fingerprint capability. It is also used to access patient information whose fingerprint
    had already been registered in the system. Navigate through the menu bars above. You can hover the mouse over a certain menu that is not clear to get more information about it.</p>
</div>
<div id="showdefaultsettings" style="display:hidden;" class="container">
          <fieldset style="width:80%;text-align:center;">
            <p>Choose the default finger in the dropdown below and click apply to save you setting.</p><br/>
            <select id="defaultfinger" style="width:80%;text-align:center;">
              <option>left thumb</option>
              <option>left index</option>
              <option>left middle</option>
              <option>left ring</option>
              <option>left little</option>
              <option>right thumb</option>
              <option>right index</option>
              <option>right middle</option>
              <option>right ring</option>
              <option>right little</option>
            </select>
            <br/></br/>
            <button style="width:60%;" id="applydefaultfinger" style="background-color:#4ebaaa !important;">APPLY SETTINGS</button>
          </fieldset>
            
</div>
<!-- end of trial-->
<div id="mainframecontainer" class="container" style="display:none;">
    <!--<div class="navbar navbar-custom">
        <div>
            <a href="#"><i class="icon-home"></i> mUzima Fingerprint Module</a>
        </div>
    </div>-->

    <!-- sign in screen -->
    <div id="signinscreen" style="display:hidden;">
        <div id="find-patient">
            <div class = "row forms-list">
                <div class ="col-lg-12" >
                    <table  id="find-options">
                        <thead>
                        <tr class = "forms-header">
                            <th>Find Patient(s)</th>
                            <th></th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Patient Identifier or Patient Name:<input type="text" id="findPatients" name="findPatients" value="${identifier}" onkeypress="activate(this.value, event)"></td>
                            <td><div id="downloadDiv">
                                <a style="text-decoration:none;" href="${pageContext.request.contextPath}/moduleResources/muzimabiometrics/fingerprint.jnlp" id="download"><b>Please place your left thumb on to the scanner & click here</b></a>
                            <input type="hidden" id="startScanning"/>
                            <input type="hidden" id="fingerprintScan" />
                            </div>
                            <div id="refreshDiv">
                                <span>Fingerprint processing timed out, please click refresh to continue</span>
                                <button type="button" id="refresh" class="btn btn-lg btn-primary">Refresh</button>
                              </div>
                                <div id="spinner">
                                    <div class="loader"></div>
                                    <span>Scanning In Progress</span>
                                </div>
                            </td>
                            <td><button type="button" id="reload" class="btn btn-lg btn-primary" style="background-color:#4ebaaa !important;">Clear Data</button></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- -->

    <div id="patientCreated">
        <h5>Patient Created</h5>
    </div>
    <div id="body-wrapper">
        <div class = "row forms-list">
            <div class ="col-lg-12" >
                <table  id="tblData">
                    <thead >
                    <tr class = "forms-header">
                        <th>Matching Patient List</th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                    </thead>
                    <thead >
                    <tr class = "forms-list-header">
                        <th style="display:none;"></th>
                        <th>ID</th>
                        <th>First Name</th>
                        <th>Family Name</th>
                        <th>Identifier(s)</th>
                        <th>Gender</th>
                        <th>Fingerprint</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div id="searchResults" style="margin:0 auto;padding:10px;border: 1px solid gray;text-align: center;color:red;">
        <h5>No patient found with this identifier. Please search patient using fingerprint</h5>
    </div>
        <div id="exception_device" class="modal fade" role="dialog" style="margin:0 auto;padding:10px;border: 1px solid gray;text-align: center;color:red;">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Scanner Error</h4>
            </div>
            <div class="modal-body">
              <p>Scanner not found, please insert scanner to continue.</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>
      <div id="exception_quality" class="modal fade" role="dialog" style="margin:0 auto;padding:10px;border: 1px solid gray;text-align: center;color:red;">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Scanner Error</h4>
          </div>
          <div class="modal-body">
            <p>Low quality image captured, please scan again.</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    <div id="exception_swipe" class="modal fade" role="dialog" style="margin:0 auto;padding:10px;border: 1px solid gray;text-align: center;color:red;">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Scanner Error</h4>
        </div>
        <div class="modal-body">
          <p>Finger swipe was too short,please scan again.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
      <div id="exception_center" class="modal fade" role="dialog" style="margin:0 auto;padding:10px;border: 1px solid gray;text-align: center;color:red;">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Scanner Error</h4>
          </div>
          <div class="modal-body">
            <p>Please center your finger and scan again.</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
    </div>
    <div id="exception_pressure" class="modal fade" role="dialog" style="margin:0 auto;padding:10px;border: 1px solid gray;text-align: center;color:red;">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Scanner Error</h4>
            </div>
            <div class="modal-body">
              <p>Weak finger pressure ,please insert some pressure on to the scanner and retry.</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
      </div>
      <div id="exeption_native" class="modal fade" role="dialog" style="margin:0 auto;padding:10px;border: 1px solid gray;text-align: center;color:red;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Scanner Error</h4>
              </div>
              <div class="modal-body">
                <p>Unable to load fingerprint software,please contact the system admin.</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
    <div id = "registrationSection">
        <div id = "updatePatient" class="btn btn-lg btn-primary">
            <input id = "btnUpdatePatient" type="button" value= "Update Selected patient" class="btn btn-lg btn-primary">
            <input id = "btnCancel" class="btn btn-lg btn-primary" type="button" value= "Cancel">
        </div>
        <div id = "otherIdentificationOption">
            <h4>No patient found with this fingerprint, Do you want to register?</h4>
            <a href="#" id="btnYes">Yes</a>
            <a href="#" id="btnNo">No</a>
        </div>
        <div style="height:20px;"></div>
        <div id="enrollFingerprint" style="margin:0 auto;padding:10px;border: 1px solid gray;text-align: center;">
            <span style="font-weight:bold;color: red;">Fingerprint does not match any patient. Please scan the left thumb finger three times to register.</span><br>
            <a style="text-decoration:none;" href="${pageContext.request.contextPath}/moduleResources/muzimabiometrics/enroll-fingerprint.jnlp"><b>Click here to enroll left thumb finger three times</b></a>
        <button type="button" id="enrollFingers" class="btn btn-lg btn-primary">Confirm Scanned Thumb Finger</button>
        </div>
        <div style="height:20px;"></div>
        <div id="addFingerprints" style="margin:0 auto;padding:10px;border: 1px solid gray;text-align: center;">
            <span id="selected-patient" style="font-weight:bold;color:green;"></span><br>
            <a style="text-decoration:none;" href="${pageContext.request.contextPath}/moduleResources/muzimabiometrics/enroll-fingerprint.jnlp"><b>Click here to enroll left thumb finger three times</b></a>
            <button type="button" id="addFingers" class="btn btn-lg btn-primary">Add Fingerprints</button>
        </div>
    </div>
    <!--start of registration click content -->
    <div id = "registrationSections">
            <div style="height:20px;"></div>
            <div class="enrollfingerprints" id="enrollFingerprint" style="margin:0 auto;padding:10px;border: 1px solid gray;text-align: center;">
            <fieldset>
            <legend>Patient Registration</legend>
            <table style="width:100%;">
            <tr style="width:100%;">
            <span style="font-weight:bold;color:green;">Click Scan Finger button below to capture your fingerprint before registering patient details</span>
            </tr><br/><br/>
            <tr style="width:100%;">
            <a style="text-decoration:none;width:100%;" href="${pageContext.request.contextPath}/moduleResources/muzimabiometrics/enroll-fingerprint.jnlp"><button>Scan left thumb finger three times</button></a>
            </tr>
            </table>
            </fieldset>
            </div>
            <div style="height:20px;"></div>
    </div>
    <!--end of registration click content -->
        <div id = "registrationForm" style="margin-left:0px;">
            <h3 id="form-title">Registration Form</h3>
            <form id = "formData" method = "post" action = "" style="border: 1px solid #eeeeee;padding:20px;">
                    <div class="form-group">
                        <label for= "given_name">First Name</label>
                        <input autocomplete="off" type="text" name="given_name" class="form-control" required>
                    </div>
                        <label for= "middle_name">Middle Name</label>
                        <input autocomplete="off" type="text" name="middle_name" class="form-control" required>
                    <div class="form-group">
                        <label for= "family_name">Family Name</label>
                        <input autocomplete="off" type="text" name="family_name" class="form-control" required>
                    </div>
                    <div class="form-inline">
                            <input type="radio" name="sex" value = "F" class="form-control"><b>Female</b>
                            <input type="radio" name="sex" value = "M" class="form-control"><b>Male</b>
                    </div>
                    <div class="form-group">
                        <label for= "phone_number">Phone Number</label>
                        <input autocomplete="off" type="text" name="phone_number" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for= "mothers_name">Mothers Name</label>
                        <input autocomplete="off" type="text" name="mothers_name" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for= "amrs_id">AMRS Universal ID Assigned</label>
                        <input autocomplete="off" type="text" name="amrs_id" id="amrs_id" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for= "fingerprint">Finger Print</label>
                        <img src ="${pageContext.request.contextPath}/moduleResources/muzimabiometrics/images/done.png"/>
                    </div>
                    <div class="form-group">
                        <label for= "age">Age</label>
                        <input autocomplete="off" name="age" class="form-control"  required>
                    </div>
                    <div class="form-group">
                        <label for= "location_id">Encounter Location</label>
                        <select id = "LocationOptions" name="location_id" class="form-control" required>
                            <option  value="">...</option>
                        </select>
                    </div>
            </form>
            <br/>
            <div>
                <input id = "btnCreatePatient" type="button" value= "Create Patient" class="btn btn-lg btn-primary btn-block">
            </div>
        </div>
        <div id="patient-exists" class="modal fade" role="dialog" style="margin:0 auto;padding:10px;border: 1px solid gray;text-align: center;color:red;">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Server Error</h4>
            </div>
            <div class="modal-body">
              <p>The patient identifier already exists, please use a different one.</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
        </div>
        <div id="missing-first-scan" class="modal fade" role="dialog" style="margin:0 auto;padding:10px;border: 1px solid gray;text-align: center;color:red;">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Server Error</h4>
            </div>
            <div class="modal-body">
              <p>First left thumb scan has not been performed, please enroll it to proceed</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
        </div>
        <div id="missing-second-scan" class="modal fade" role="dialog" style="margin:0 auto;padding:10px;border: 1px solid gray;text-align: center;color:red;">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Server Error</h4>
            </div>
            <div class="modal-body">
              <p>Second left thumb scan has not been performed, please enroll it to proceed</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
        </div>
        <div id="missing-third-scan" class="modal fade" role="dialog" style="margin:0 auto;padding:10px;border: 1px solid gray;text-align: center;color:red;">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Server Error</h4>
            </div>
            <div class="modal-body">
              <p>Third left thumb scan has not been performed, please enroll it to proceed</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
        </div>
        <div id="fingerprint-exists" class="modal fade" role="dialog" style="margin:0 auto;padding:10px;border: 1px solid gray;text-align: center;color:red;">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <h4 class="modal-title">Server Error</h4>
            </div>
            <div class="modal-body">
              <p>This patient's fingerprint matches an existing patient, it cannot be appended</p>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
          </div>
        </div>
        </div>
</div>
<script>

    var openmrsContextPath = '${pageContext.request.contextPath}';

</script>

<openmrs:htmlInclude file="/moduleResources/muzimabiometrics/js/custom/settings.js"/>
<openmrs:htmlInclude file="/moduleResources/muzimabiometrics/js/custom/Custom.js"/>
