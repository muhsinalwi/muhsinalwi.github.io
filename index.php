<?php require_once('config.php'); ?>
<!DOCTYPE html>
<html lang="en">
<?php require_once('inc/header.php') ?>

<body>
  <?php require_once('inc/topBarNav.php') ?>
  <?php $page = isset($_GET['p']) ? $_GET['p'] : 'home';  ?>
  <?php
  if (!file_exists($page . ".php") && !is_dir($page)) {
    include '404.html';
  } else {
    if (is_dir($page))
      include $page . '/index.php';
    else
      include $page . '.php';
  }
  ?>
  <?php require_once('inc/footer.php') ?>
  <div class="modal fade" id="confirm_modal" role='dialog'>
    <div class="modal-dialog modal-md modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Confirmation</h5>
        </div>
        <div class="modal-body">
          <div id="delete_content"></div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id='confirm' onclick="">Continue</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="uni_modal" role='dialog'>
    <div class="modal-dialog   rounded-0 modal-md modal-dialog-centered" role="document">
      <div class="modal-content  rounded-0">
        <div class="modal-header">
          <h5 class="modal-title"></h5>
        </div>
        <div class="modal-body">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" id='submit' onclick="$('#uni_modal form').submit()">Save</button>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="uni_modal_right" role='dialog'>
    <div class="modal-dialog  rounded-0 modal-full-height  modal-md" role="document">
      <div class="modal-content rounded-0">
        <div class="modal-header">
          <h5 class="modal-title"></h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span class="fa fa-arrow-right"></span>
          </button>
        </div>
        <div class="modal-body">
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="viewer_modal" role='dialog'>
    <div class="modal-dialog modal-md" role="document">
      <div class="modal-content">
        <button type="button" class="btn-close" data-dismiss="modal"><span class="fa fa-times"></span></button>
        <img src="" alt="">
      </div>
    </div>
  </div>

</body>

</html>

<style>
  .float-button {
    position: fixed;
    bottom: 20px;
    right: 20px;
  }

  .float-button button {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
    border-radius: 5px;
  }
</style>

<div class="modal fade" id="confirm_modal" role='dialog'>
  <div class="modal-dialog modal-md modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Confirmation</h5>
      </div>
      <div class="modal-body">
        <div id="delete_content"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id='confirm' onclick="">Continue</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="uni_modal" role='dialog'>
  <div class="modal-dialog   rounded-0 modal-md modal-dialog-centered" role="document">
    <div class="modal-content  rounded-0">
      <div class="modal-header">
        <h5 class="modal-title"></h5>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id='submit' onclick="$('#uni_modal form').submit()">Save</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="uni_modal_right" role='dialog'>
  <div class="modal-dialog  rounded-0 modal-full-height  modal-md" role="document">
    <div class="modal-content rounded-0">
      <div class="modal-header">
        <h5 class="modal-title"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span class="fa fa-arrow-right"></span>
        </button>
      </div>
      <div class="modal-body">
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="viewer_modal" role='dialog'>
  <div class="modal-dialog modal-md" role="document">
    <div class="modal-content">
      <button type="button" class="btn-close" data-dismiss="modal"><span class="fa fa-times"></span></button>
      <img src="" alt="">
    </div>
  </div>
</div>
<!-- <div class="float-button">
    <button>Click Me</button>
  </div> -->
<style>
  #chat_convo {
    max-height: 65vh;
  }

  #chat_convo .direct-chat-messages {
    min-height: 250px;
    height: inherit;
  }

  #chat_convo .card-body {
    overflow: auto;
  }
</style>
<div class="container-fluid">
  <div class="row">
    <div class="col-lg-4 float-button">
      <div class="card direct-chat direct-chat-primary" id="chat_convo">
        <div class="card-header ui-sortable-handle" style="cursor: move;">
          <h3 class="card-title">Ask Me</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse">
              <i class="fas fa-minus"></i>
            </button>
          </div>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
          <!-- Conversations are loaded here -->
          <div class="direct-chat-messages">
            <!-- Message. Default to the left -->
            <div class="direct-chat-msg mr-4">
              <img class="direct-chat-img border-1 border-primary" src="chatbot/uploads/1620181980_bot2.jpg" alt="message user image">
              <!-- /.direct-chat-img -->
              <div class="direct-chat-text">
                <?php echo $_settings_chatbot->info('intro') ?>
              </div>
              <!-- /.direct-chat-text -->
            </div>
            <!-- /.direct-chat-msg -->


            <!-- /.contacts-list -->
          </div>
          <div class="end-convo"></div>
          <!-- /.direct-chat-pane -->
        </div>
        <!-- /.card-body -->
        <div class="card-footer">
          <form id="send_chat" method="post">
            <div class="input-group">
              <textarea type="text" name="message" placeholder="Type Message ..." class="form-control" required=""></textarea>
              <span class="input-group-append">
                <button type="submit" class="btn btn-primary">Send</button>
              </span>
            </div>
          </form>
        </div>
        <!-- /.card-footer-->
      </div>
    </div>
  </div>
</div>
<div class="d-none" id="user_chat">
  <div class="direct-chat-msg right  ml-4">
    <img class="direct-chat-img border-1 border-primary" src="chatbot/uploads/user_avatar.jpg" alt="message user image">
    <!-- /.direct-chat-img -->
    <div class="direct-chat-text"></div>
    <!-- /.direct-chat-text -->
  </div>
</div>
<div class="d-none" id="bot_chat">
  <div class="direct-chat-msg mr-4">
    <img class="direct-chat-img border-1 border-primary" src="chatbot/uploads/1620181980_bot2.jpg" alt="message user image">
    <!-- /.direct-chat-img -->
    <div class="direct-chat-text"></div>
    <!-- /.direct-chat-text -->
  </div>
</div>
<script type="text/javascript">
  $(document).ready(function() {
    $('[name="message"]').keypress(function(e) {
      console.log()
      if (e.which === 13 && e.originalEvent.shiftKey == false) {
        $('#send_chat').submit()
        return false;
      }
    })
    $('#send_chat').submit(function(e) {
      e.preventDefault();
      var message = $('[name="message"]').val();
      if (message == '' || message == null) return false;
      var uchat = $('#user_chat').clone();
      uchat.find('.direct-chat-text').html(message);
      $('#chat_convo .direct-chat-messages').append(uchat.html());
      $('[name="message"]').val('')
      $("#chat_convo .card-body").animate({
        scrollTop: $("#chat_convo .card-body").prop('scrollHeight')
      }, "fast");

      $.ajax({
        url: _base_url_ + "/chatbot/classes/Master.php?f=get_response",
        method: 'POST',
        data: {
          message: message
        },
        error: err => {
          console.log(err)
          alert_toast("An error occured.", 'error');
          end_loader();
        },
        success: function(resp) {
          if (resp) {
            resp = JSON.parse(resp)
            if (resp.status == 'success') {
              var bot_chat = $('#bot_chat').clone();
              bot_chat.find('.direct-chat-text').html(resp.message);
              $('#chat_convo .direct-chat-messages').append(bot_chat.html());
              $("#chat_convo .card-body").animate({
                scrollTop: $("#chat_convo .card-body").prop('scrollHeight')
              }, "fast");
            }
          }
        }
      })
    })

  })
</script>