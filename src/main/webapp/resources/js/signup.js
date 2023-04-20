// 에러 메세지 객체
const errMsg = {
    id: { 
      invalid: "4~20자의 영문 소문자와 숫자만 사용 가능합니다",
      success: "사용 가능한 아이디입니다",
      fail: "사용할 수 없는 아이디입니다"
    },
    pw: "4~20자의 영문, 숫자를 모두 포함한 비밀번호를 입력해주세요",
    pwRe: {
      success: "비밀번호가 일치합니다",
      fail: "비밀번호가 일치하지 않습니다"
    },
  }
var account = {pw:""};

  // pwVal: 패스워드, pwReVal: 패스워드 재입력, isPwValid: 패스워드 유효 여부
let pwVal = "", pwReVal = "", isPwValid = false
const pwInputEl = document.querySelector('#info_pw1 input')
const pwErrorMsgEl = document.querySelector('#info_pw1 .error-msg')

pwInputEl.addEventListener('change', () => {
  const pwRegExp = /^(?=.*[A-Za-z])(?=.*[0-9])[a-zA-Z0-9]{4,20}$/
  pwVal = pwInputEl.value
  if(pwRegExp.test(pwVal)) { // 정규식 조건 만족 O
    isPwValid = true
    pwErrorMsgEl.textContent = ""
  } 
  else { // 정규식 조건 만족 X
    isPwValid = false
    pwErrorMsgEl.textContent = errMsg.pw
  }
  checkPwValid()
  console.log(pwVal, pwReVal, isPwValid, account)
});

/*** SECTION - PASSWORD RECHECK ***/
const pwReInputEl = document.querySelector('#info_pw2 input')
const pwReErrorMsgEl = document.querySelector('#info_pw2 .error-msg')
pwReInputEl.addEventListener('change', () => {
  pwReVal = pwReInputEl.value
  checkPwValid()
  console.log(pwVal, pwReVal, isPwValid, account)
});

// 비밀번호와 재입력 값 일치 여부
function checkPwValid() {
  account.pw = null // default null 처리
  if(pwReVal === "") { // 미입력
    pwReErrorMsgEl.textContent = ""
  }
  else if(pwVal === pwReVal) { // 비밀번호 재입력 일치
    if(isPwValid)
      account.pw = pwVal
    pwReErrorMsgEl.style.color = "green"
    pwReErrorMsgEl.textContent = errMsg.pwRe.success
    pwReErrorMsgEl.style.margin = "5px 0px 0px -230px"
  }
  else { // 비밀번호 재입력 불일치
    pwReErrorMsgEl.style.color = "red"
    pwReErrorMsgEl.textContent = errMsg.pwRe.fail
    pwReErrorMsgEl.style.margin = "5px 0px 0px -190px"
  }
}