// SPDX-License-Identifier: UNLICENSED
// Solidityのバージョン
pragma solidity ^0.8.0;

contract  MyToken {
  // トークンの名前
  string public name = "MyToken";
  // トークンの単位
  string public symbol = "MTK";
  // トークンの最大供給量
  uint256 public totalSupply = 1000000;
  // このコントラクトのオーナー
  address public owner;

  // トークンの所有者のアドレスと所有量をマッピング
  mapping(address => uint256) balances;
  // イベント
  event Transfer(address indexed _from, address indexed _to, uint256 _value);

  /**
   * コンストラクタ
   */
  constructor() {
    // コントラクト作成者に最大供給量分のトークンを割り当てる
    balances[msg.sender] = totalSupply;
    // オーナーをコントラクト作成者に設定
    owner = msg.sender;
  }

  /**
   * トークンを転送する関数
   * @param to 転送先のアドレス
   * @param amount 転送するトークンの量
   */
  function transfer(address to, uint256 amount) external {
    // この関数を実行したアドレスの残高に指定したトークン量があるかチェック
    require(balances[msg.sender] >= amount, "Not enough tokens");

    // この関数を実行したアドレスの残高から指定したトークン量を差し引く
    balances[msg.sender] -= amount;
    // 指定したアドレスの残高に指定したトークン量を加える
    balances[to] += amount;

    // イベントを発火
    emit Transfer(msg.sender, to, amount);
  }

  /**
   * 指定したアドレスの残高を返す関数
   * @param account 残高を確認したいアドレス
   * @return 残高
   */
  function balanceOf(address account) external view returns (uint256) {
    // 指定したアドレスの残高を返す
    return balances[account];
  }
}