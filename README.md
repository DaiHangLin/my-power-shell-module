# my-power-shell-module

##  其实不用这么麻烦

### powerShell 自带alias,  在 $profile 文件里添加 Set-Alias 就可以了

```
Set-Alias -Name ll -Value Get-ChildItem
```

### 此項目是爲了在powerShell中添加一些常用的alias，方便開發

1. my-module整个文件夹需要放在 $profile 的 Modules 文件夹下
2. 整个目录结构相对简单
   ```
    my-module:
    │  README.md
    │
    └─0.0.1
            my-module.psd1
            my-module.psm1
   ```
3. 需要在powerShell的配置文件中添加如下一行
```
Import-Module my-module
```
2. powershell的配置文件地址可以輸入下面的命令查看, 如果沒有，可以自行創建
```
$profile
```

3. 重啓powerShell后就可以了

### 如何配置

1. 需要再my-moudle.psd1, 配置RootModule文件
   ```
   RootModule = 'my-module.psm1'
   ```
2. 需要一个唯一的GUID，可以通过powerShell命令行直接生成
    ```
    New-Guid
    ```
3. 新建my-module.psm1,在这里添加需要的alias, 定义需要export的成员方法   
   
   ```
   $exportModuleMemberParams = @{
    Function = @(
      'open',
    )}
    Export-ModuleMember @exportModuleMemberParams
   ```
4. 实现function
   这里默认打开当前的文件，function也可以直接参数
   ```
   function open {
     explorer .
   }
   ```

